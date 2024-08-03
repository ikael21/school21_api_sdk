# frozen_string_literal: true

module School21
  class AuthorizationHeader < CoreLibrary::HeaderAuth
    def error_message
      'BearerAuth: access_token is undefined.'
    end

    def initialize(bearer_auth_credentials)
      auth_params = {}

      @access_token = bearer_auth_credentials.access_token unless
        bearer_auth_credentials.nil? || bearer_auth_credentials.access_token.nil?

      auth_params['Authorization'] = "Bearer #{@access_token}" unless @access_token.nil?

      super(auth_params)
    end
  end
end
