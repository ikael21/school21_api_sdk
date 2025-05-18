# frozen_string_literal: true

module School21
  class AccessToken
    attr_reader :access_token

    def initialize(access_token, expires_in)
      @access_token = access_token
      @expires_at = Time.now + expires_in
    end

    def expired?
      access_token.nil? || Time.now >= @expires_at
    end
  end
end
