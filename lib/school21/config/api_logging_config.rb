# frozen_string_literal: true

module School21
  class ApiLoggingConfig < CoreLibrary::ApiLoggingConfiguration
    attr_writer :request_logging_config, :response_logging_config
  end
end
