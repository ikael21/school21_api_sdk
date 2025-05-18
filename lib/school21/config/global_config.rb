# frozen_string_literal: true

module School21
  class GlobalConfig < CoreLibrary::GlobalConfiguration
    attr_accessor :auth_managers, :enable_logging, :credentials, :logger, :access_token

    def initialize(client_configuration: ClientConfig.new)
      super

      @enable_logging = false
      @credentials = {}
      @access_token = AccessToken.new(nil, 0)

      http_client = CoreLibrary::FaradayClient.new(client_configuration)
      client_configuration.set_http_client(http_client)
    end

    def initialize_logger
      logger ||= semantic_logger

      excluded_headers = ['Authorization']
      api_logging_config = School21::ApiLoggingConfig.new(logger, nil, nil, nil, false)
      api_logging_config.request_logging_config =
        CoreLibrary::ApiRequestLoggingConfiguration.new(true, true, excluded_headers, nil, nil, true)
      api_logging_config.response_logging_config =
        CoreLibrary::ApiResponseLoggingConfiguration.new(true, true, nil, nil, nil)
      client_configuration.logging_configuration = api_logging_config
    end

    private

    def semantic_logger
      SemanticLogger.default_level = :trace
      SemanticLogger.add_appender(io: $stdout, formatter: :color)

      SemanticLogger[School21.name]
    end
  end
end
