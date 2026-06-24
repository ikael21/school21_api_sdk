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

    it 'calls stub participant workstation success' do
      stubs = [
        stub_token_success,
        stub_participant_workstation_success
      ]

      School21.participants_api.participant_workstation(login)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant skills success' do
      stubs = [
        stub_token_success,
        stub_participant_skills_success
      ]

      School21.participants_api.participant_skills(login)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant projects success' do
      stubs = [
        stub_token_success,
        stub_participant_projects_success
      ]

      School21.participants_api.participant_projects(login, options: { status: 'IN_PROGRESS' })

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant project success' do
      stubs = [
        stub_token_success,
        stub_participant_project_success
      ]

      School21.participants_api.participant_project(login, 12_313)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant points success' do
      stubs = [
        stub_token_success,
        stub_participant_points_success
      ]

      School21.participants_api.participant_points(login)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant logtime success' do
      stubs = [
        stub_token_success,
        stub_participant_logtime_success
      ]

      School21.participants_api.participant_logtime(login, date: '2026-01-01')

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant feedback success' do
      stubs = [
        stub_token_success,
        stub_participant_feedback_success
      ]

      School21.participants_api.participant_feedback(login)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant experience history success' do
      stubs = [
        stub_token_success,
        stub_participant_experience_history_success
      ]

      School21.participants_api.participant_experience_history(login)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant courses success' do
      stubs = [
        stub_token_success,
        stub_participant_courses_success
      ]

      School21.participants_api.participant_courses(login, options: { status: 'ACCEPTED' })

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant course success' do
      stubs = [
        stub_token_success,
        stub_participant_course_success
      ]

      School21.participants_api.participant_course(login, 42)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant coalition success' do
      stubs = [
        stub_token_success,
        stub_participant_coalition_success
      ]

      School21.participants_api.participant_coalition(login)

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub participant badges success' do
      stubs = [
        stub_token_success,
        stub_participant_badges_success
      ]

      School21.participants_api.participant_badges(login)

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
