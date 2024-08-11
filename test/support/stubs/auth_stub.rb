# frozen_string_literal: true

module AuthStub
  include BaseStub

  def stub_token
    body = {
      access_token: 'access_token',
      expires_in: 36_000
    }

    stub_request(:post, stubbed_auth_url).to_return_json(body:)
  end

  private

  def stubbed_auth_url
    [BASE_AUTH_URL, '/auth/realms/EduPowerKeycloak/protocol/openid-connect/token'].join
  end
end
