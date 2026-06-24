# frozen_string_literal: true

require 'test_helper'

describe 'Projects API Test' do
  include AuthStub
  include ProjectsStub

  with_configured_client do
    it 'calls stub project success' do
      stubs = [
        stub_token_success,
        stub_project_success
      ]

      School21.projects_api.project(ProjectsStub::TEST_PROJECT_ID)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub project participants success' do
      stubs = [
        stub_token_success,
        stub_project_participants_success
      ]

      School21.projects_api.project_participants(ProjectsStub::TEST_PROJECT_ID)

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
