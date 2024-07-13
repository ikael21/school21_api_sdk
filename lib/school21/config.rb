# frozen_string_literal: true

module School21
  class Config < CoreLibrary::HttpClientConfiguration
    BASE_URL = 'https://edu-api.21-school.ru/services/21-school/api/v1'
    AUTH_BASE_URL = 'https://auth.sberclass.ru/auth/realms/EduPowerKeycloak/protocol/openid-connect/token'

    attr_reader :custom_url, :auth_custom_url, :credentials

    def initialize(custom_url: BASE_URL, auth_custom_url: AUTH_BASE_URL, login: nil, password: nil)
      raise ArgumentError, 'login is nil or empty' if login.nil? || login.empty?
      raise ArgumentError, 'password is nil or empty' if password.nil? || password.empty?

      super()

      @custom_url = custom_url
      @auth_custom_url = auth_custom_url
      @credentials = { login: login, password: password }

      set_http_client(CoreLibrary::FaradayClient.new(self))
    end
  end
end
