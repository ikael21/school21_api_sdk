# frozen_string_literal: true

module School21
  class Client
    include CoreLibrary

    def self.configure(&)
      new(&)
    end

    def initialize(&block)
      raise 'A block must be given' unless block_given?
      raise 'You must provide block argument that represents config instance' if block.arity != 1

      @config = GlobalConfig
                .new
                .base_uri_executor(BaseApi.method(:base_uri))

      yield(@config)

      validate_credentials!

      initialize_logging

      http_client = FaradayClient.new(@config.client_configuration)
      @config.client_configuration.set_http_client(http_client)

      initialize_auth!
    end

    def auth_api
      @auth_api ||= AuthApi.new(@config)
    end

    def participants_api
      initialize_auth! if @access_token.expired?
      ParticipantsApi.new(@config)
    end

    def projects_api
      initialize_auth! if @access_token.expired?
      ProjectsApi.new(@config)
    end

    def campuses_api
      initialize_auth! if @access_token.expired?
      CampusesApi.new(@config)
    end

    def clusters_api
      initialize_auth! if @access_token.expired?
      ClustersApi.new(@config)
    end

    private

    def validate_credentials!
      login = @config.credentials[:login]
      password = @config.credentials[:password]

      raise "Login can't be nil or empty" if login.nil? || login.empty?
      raise "Password can't be nil or empty" if password.nil? || password.empty?
    end

    def initialize_auth!
      @access_token = request_access_token!

      initialize_auth_managers
    end

    def initialize_auth_managers
      auth_managers = {}

      creds = BearerAuthCredentials.new(access_token: @access_token)
      auth_managers[BaseApi::SINGLE_AUTH_PARTICIPANT] = AuthorizationHeader.new(creds)

      @config.auth_managers = auth_managers
    end

    def request_access_token!
      auth_api_response = auth_api.token(login: @config.credentials[:login], password: @config.credentials[:password])
      raise 'Access Token Error' unless auth_api_response.success?

      AccessToken.new(*auth_api_response.data.values_at(:access_token, :expires_in))
    end

    def initialize_logging
      return unless @config.enable_logging

      headers_to_exclude = ['Authorization']
      api_logging_config = ApiLoggingConfig.new(nil, nil, nil, nil, false)
      api_logging_config.request_logging_config = ApiRequestLoggingConfiguration.new(true, true, headers_to_exclude,
                                                                                     nil, nil, true)
      api_logging_config.response_logging_config = ApiResponseLoggingConfiguration.new(true, true, nil, nil, nil)

      @config.client_configuration.logging_configuration = api_logging_config
    end
  end
end
