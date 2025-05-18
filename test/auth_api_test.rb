# frozen_string_literal: true

require 'test_helper'

describe 'Auth API Test' do
  include AuthStub

  with_configured_client do
    let(:auth_api_call) do
      School21.auth_api.token(
        login: School21.config.credentials[:login],
        password: School21.config.credentials[:password]
      )
    end

    it 'calls stub token success' do
      stub = stub_token_success

      auth_api_call

      assert_requested(stub)
    end

    it 'calls stub token fail' do
      stub = stub_token_fail

      response = auth_api_call

      assert_requested(stub)
      assert_equal(500, response.status_code)
    end
  end
end
