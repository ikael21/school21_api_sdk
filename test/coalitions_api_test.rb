# frozen_string_literal: true

require 'test_helper'

describe 'Coalitions API Test' do
  include AuthStub
  include CoalitionsStub

  with_configured_client do
    it 'calls stub coalition participants success' do
      stubs = [
        stub_token_success,
        stub_coalition_participants_success
      ]

      School21.coalitions_api.coalition_participants(CoalitionsStub::TEST_COALITION_ID)

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
