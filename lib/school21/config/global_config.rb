# frozen_string_literal: true

module School21
  class GlobalConfig < CoreLibrary::GlobalConfiguration
    attr_accessor :auth_managers, :enable_logging, :credentials
    attr_writer :client_configuration

    def initialize(client_configuration: ClientConfig.new)
      super

      @enable_logging = false
      @credentials = {}
    end
  end
end
