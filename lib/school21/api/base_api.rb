# frozen_string_literal: true

module School21
  class BaseApi
    include CoreLibrary

    SINGLE_AUTH_PARTICIPANT = :global

    def self.base_uri(server)
      case server
      when :api_v1
        'https://edu-api.21-school.ru/services/21-school/api/v1'
      when :auth
        'https://auth.sberclass.ru/auth/realms/EduPowerKeycloak/protocol/openid-connect'
      end
    end

    def self.response_convertor(api_response)
      api_response.data.deep_transform_keys! do |key|
        key.underscore.to_sym
      end

      api_response
    end

    def initialize(global_configuration)
      @global_configuration = global_configuration
      @api_call = ApiCall.new(@global_configuration)
    end

    def new_api_call_builder = @api_call.new_builder

    def new_response_handler
      ResponseHandler.new
                     .deserializer(ApiHelper.method(:json_deserialize))
                     .is_api_response(true)
                     .convertor(self.class.method(:response_convertor))
    end

    def new_request_builder(http_method, path, server)
      RequestBuilder.new
                    .http_method(http_method)
                    .path(path)
                    .server(server)
    end

    def new_parameter(value, key: nil)
      Parameter.new
               .key(key)
               .value(value)
    end
  end
end
