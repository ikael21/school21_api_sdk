# frozen_string_literal: true

module School21
  class BearerAuthCredentials
    attr_reader :access_token

    def initialize(access_token:)
      case access_token
      in String
        @access_token = access_token
      in AccessToken
        @access_token = access_token.access_token
      end
    end
  end
end
