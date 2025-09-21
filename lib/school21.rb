# frozen_string_literal: true

require 'apimatic_core'
require 'apimatic_faraday_client_adapter'
require 'semantic_logger'

require 'active_support/all'

require_relative 'school21/auth/access_token'
require_relative 'school21/auth/authorization_header'
require_relative 'school21/auth/bearer_auth_credentials'
require_relative 'school21/auth/authenticator'

require_relative 'school21/api/base_api'
require_relative 'school21/api/participants_api'
require_relative 'school21/api/auth_api'
require_relative 'school21/api/projects_api'
require_relative 'school21/api/campuses_api'
require_relative 'school21/api/clusters_api'
require_relative 'school21/api/graph_api'

require_relative 'school21/config/api_logging_config'
require_relative 'school21/config/client_config'
require_relative 'school21/config/global_config'

module School21
  class << self
    def configure
      yield config
      config.initialize_logger if config.enable_logging
      config
    end

    def config
      @config ||= GlobalConfig.new.base_uri_executor(BaseApi.method(:base_uri))
    end

    def reset!
      @config = nil
    end

    API_CLASSES_MAPPINGS = [
      AuthApi,
      ParticipantsApi,
      ProjectsApi,
      CampusesApi,
      ClustersApi,
      GraphApi
    ].freeze

    API_CLASSES_MAPPINGS.each do |klass|
      method_name = klass.name.underscore.split('/').last.to_sym
      define_method(method_name) do
        klass.new
      end
    end
  end
end
