# frozen_string_literal: true

module ParticipantsStub
  include BaseStub

  TEST_LOGIN = 'test_login'
  STUBBED_PARTICIPANT_URL = [BASE_API_V1_URL, '/participants/', TEST_LOGIN].join

  def stub_participant_success
    stub_request(:get, STUBBED_PARTICIPANT_URL)
      .to_return_json(body: { login: TEST_LOGIN })
  end

  def stub_participant_fail
    stub_request(:get, STUBBED_PARTICIPANT_URL)
      .to_return(status: [500, 'Internal Server Error'])
  end
end
