# frozen_string_literal: true

module AuthStub
  include BaseStub

  STUBBED_AUTH_URL = [BASE_AUTH_URL, '/auth/realms/EduPowerKeycloak/protocol/openid-connect/token'].join

  def stub_token_success
    stub_request(:post, STUBBED_AUTH_URL)
      .to_return_json(body: {
                        access_token: 'access_token',
                        expires_in: 36_000
                      })
  end

  def stub_token_fail
    base_stub_fail(:post, STUBBED_AUTH_URL)
  end
end
