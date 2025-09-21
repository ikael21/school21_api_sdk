# frozen_string_literal: true

module School21
  class BaseApi
    include CoreLibrary

    PLATFORM_AUTH_PARTICIPANT = :platform

    def self.base_uri(server)
      case server
      when :api_v1
        'https://platform.21-school.ru/services/21-school/api/v1'
      when :auth
        'https://auth.21-school.ru/auth/realms/EduPowerKeycloak/protocol/openid-connect'
      end
    end

    def self.response_convertor(api_response)
      return api_response unless api_response.data.present? && api_response.data.is_a?(Hash)

      api_response.data.deep_transform_keys! do |key|
        key.underscore.to_sym
      end

      api_response
    end

    def initialize
      @api_call = ApiCall.new(School21.config)
    end

    def new_api_call_builder
      @api_call.new_builder
    end

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

    def request_with_auth_participant(http_method, path, server)
      auth_participant = CoreLibrary::Single.new(PLATFORM_AUTH_PARTICIPANT)

      new_request_builder(http_method, path, server).auth(auth_participant)
    end

    def execute_request(new_request)
      Authenticator.call

      new_api_call_builder
        .request(new_request)
        .response(new_response_handler)
        .execute
    end
  end
end
