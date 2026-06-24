# frozen_string_literal: true

require 'test_helper'

describe 'Campuses API Test' do
  include AuthStub
  include CampusesStub

  with_configured_client do
    let(:campus_id) { CampusesStub::TEST_CAMPUS_ID }

    it 'calls stub campuses success' do
      stubs = [
        stub_token_success,
        stub_campuses_success
      ]

      School21.campuses_api.campuses

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub campus participants success' do
      stubs = [
        stub_token_success,
        stub_campus_participants_success
      ]

      School21.campuses_api.campus_participants(campus_id)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub campus coalitions success' do
      stubs = [
        stub_token_success,
        stub_campus_coalitions_success
      ]

      School21.campuses_api.campus_coalitions(campus_id)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub campus clusters success without pagination params' do
      stubs = [
        stub_token_success,
        stub_campus_clusters_success
      ]

      School21.campuses_api.campus_clusters(campus_id)

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
