# frozen_string_literal: true

module School21
  class AuthorizationHeader < CoreLibrary::HeaderAuth
    def error_message
      'BearerAuth: access_token is undefined.'
    end

    def initialize(bearer_auth_credentials)
      access_token = bearer_auth_credentials.access_token
      auth_params = {}
      auth_params['Authorization'] = "Bearer #{access_token}"

      super(auth_params)
    end
  end
end
