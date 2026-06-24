# frozen_string_literal: true

module CoalitionsStub
  include BaseStub

  TEST_COALITION_ID = 7

  def stub_coalition_participants_success
    stub_api_success(
      "/coalitions/#{TEST_COALITION_ID}/participants",
      query: { limit: 50, offset: 0 },
      body: { logins: ['test_login'] }
    )
  end
end
