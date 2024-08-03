# frozen_string_literal: true

module School21
  class Client
    include CoreLibrary

    def initialize(login:, password:)
      raise ArgumentError, "login can't be nil or empty" if login.nil? || login.empty?
      raise ArgumentError, "password can't be nil or empty" if password.nil? || password.empty?

      client_configuration = HttpClientConfiguration.new(logging_configuration:)
      http_client = FaradayClient.new(client_configuration)
      client_configuration.set_http_client(http_client)

      @login = login
      @password = password

      @config = GlobalConfiguration
                .new(client_configuration:)
                .base_uri_executor(BaseApi.method(:base_uri))

      initialize_auth!
    end

    def auth_api = @auth_api ||= AuthApi.new(@config)

    def participants_api
      initialize_auth! if @access_token.expired?

      ParticipantsApi.new(@config)
    end

    def projects_api
      initialize_auth! if @access_token.expired?

      ProjectsApi.new(@config)
    end

    private

    def initialize_auth!
      @access_token = request_access_token!

      initialize_auth_managers
    end

    def initialize_auth_managers
      auth_managers = {}

      creds = BearerAuthCredentials.new(access_token: @access_token)
      auth_managers[BaseApi::SINGLE_AUTH_PARTICIPANT] = AuthorizationHeader.new(creds)

      @config.auth_managers(auth_managers)
    end

    def request_access_token!
      auth_api_response = auth_api.token(login: @login, password: @password)
      raise 'Access Token Error' unless auth_api_response.success?

      AccessToken.new(*auth_api_response.data.values_at(:access_token, :expires_in))
    end

    def logging_configuration
      headers_to_exclude = ['Authorization']
      api_request_config = ApiRequestLoggingConfiguration.new(true, true, headers_to_exclude, nil, nil, true)
      api_response_config = ApiResponseLoggingConfiguration.new(true, true, nil, nil, nil)

      ApiLoggingConfiguration.new(nil, nil, api_request_config, api_response_config, false)
    end
  end
end
