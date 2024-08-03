# frozen_string_literal: true

module School21
  class BearerAuthCredentials
    attr_reader :access_token

    def initialize(access_token:)
      raise ArgumentError, 'access_token cannot be nil' if access_token.nil?

      @access_token = access_token.access_token
    end
  end
end
