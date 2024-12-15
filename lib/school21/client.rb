# frozen_string_literal: true

module School21
  class Client
    include CoreLibrary

    attr_reader :config, :access_token

    class << self
      def configure(&) = new(&)
    end

    def initialize(&block)
      raise 'A block must be given' unless block_given?
      raise 'You must provide block argument that represents config instance' if block.arity != 1

      @config = GlobalConfig.new.base_uri_executor(BaseApi.method(:base_uri))

      yield(@config)

      validate_credentials!

      initialize_logging if @config.enable_logging

      http_client = FaradayClient.new(@config.client_configuration)
      @config.client_configuration.set_http_client(http_client)
    end

    def authenticate!
      @access_token = request_access_token!

      initialize_auth_managers
    end

    def auth_api
      @auth_api ||= AuthApi.new(config)
    end

    def participants_api
      authenticate! if access_token.expired?
      ParticipantsApi.new(config)
    end

    def projects_api
      authenticate! if access_token.expired?
      ProjectsApi.new(config)
    end

    def campuses_api
      authenticate! if access_token.expired?
      CampusesApi.new(config)
    end

    def clusters_api
      authenticate! if access_token.expired?
      ClustersApi.new(config)
    end

    private

    def validate_credentials!
      login = config.credentials[:login]
      password = config.credentials[:password]

      raise "Login can't be nil or empty" if login.nil? || login.empty?
      raise "Password can't be nil or empty" if password.nil? || password.empty?
    end

    def initialize_auth_managers
      auth_managers = {}
      creds = BearerAuthCredentials.new(access_token:)
      auth_managers[BaseApi::SINGLE_AUTH_PARTICIPANT] = AuthorizationHeader.new(creds)

      config.auth_managers = auth_managers
    end

    def request_access_token!
      auth_api_response = auth_api.token(
        login: config.credentials[:login],
        password: config.credentials[:password]
      )

      raise 'Access Token Error' unless auth_api_response.success?

      AccessToken.new(*auth_api_response.data.values_at(:access_token, :expires_in))
    end

    def semantic_logger
      SemanticLogger.default_level = :trace
      SemanticLogger.add_appender(io: $stdout, formatter: :color)

      SemanticLogger[self.class.to_s]
    end

    def initialize_logging
      logger = if config.logger.nil?
                 semantic_logger
               else
                 config.logger
               end

      headers_to_exclude = ['Authorization']
      api_logging_config = ApiLoggingConfig.new(logger, nil, nil, nil, false)
      api_logging_config.request_logging_config = ApiRequestLoggingConfiguration.new(true, true, headers_to_exclude,
                                                                                     nil, nil, true)
      api_logging_config.response_logging_config = ApiResponseLoggingConfiguration.new(true, true, nil, nil, nil)

      config.client_configuration.logging_configuration = api_logging_config
    end
  end
end
