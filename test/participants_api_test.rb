# frozen_string_literal: true

require 'test_helper'

describe 'Participants API Test' do
  include AuthStub
  include ParticipantsStub

  with_configured_client do
    let(:login) { 'test_login' }
    let(:participants_api_call) do
      School21.participants_api.participant(login)
    end

    it 'calls stub participant success' do
      stubs = [
        stub_token_success,
        stub_participant_success
      ]

      participants_api_call

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant fail' do
      stubs = [
        stub_token_success,
        stub_participant_fail
      ]

      participants_api_call

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
