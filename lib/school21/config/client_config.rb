# frozen_string_literal: true

module School21
  class ClientConfig < CoreLibrary::HttpClientConfiguration
    attr_writer :logging_configuration, :timeout
  end
end
