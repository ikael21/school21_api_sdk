# frozen_string_literal: true

module School21
  class AccessTokenError < StandardError; end

  module Authenticator
    def self.call
      return unless School21.config.access_token.expired?

      auth_api_response = School21.auth_api.token(
        login: School21.config.credentials[:login],
        password: School21.config.credentials[:password]
      )

      raise AccessTokenError unless auth_api_response.success?

      access_token = AccessToken.new(*auth_api_response.data.values_at(:access_token, :expires_in))
      bearer_auth_credentials = BearerAuthCredentials.new(access_token:)
      auth_header = AuthorizationHeader.new(bearer_auth_credentials)

      School21.config.access_token = access_token
      School21.config.auth_managers[BaseApi::PLATFORM_AUTH_PARTICIPANT] = auth_header
    end
  end
end
