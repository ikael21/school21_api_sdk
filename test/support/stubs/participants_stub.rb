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
    base_stub_fail(:get, STUBBED_PARTICIPANT_URL)
  end

  def stub_participant_workstation_success
    stub_api_success("/participants/#{TEST_LOGIN}/workstation", body: { id: 1 })
  end

  def stub_participant_skills_success
    stub_api_success("/participants/#{TEST_LOGIN}/skills", body: { skills: [{ name: 'Ruby' }] })
  end

  def stub_participant_projects_success
    stub_api_success(
      "/participants/#{TEST_LOGIN}/projects",
      query: { limit: 10, offset: 0, status: 'IN_PROGRESS' },
      body: { projects: [{ id: 1 }] }
    )
  end

  def stub_participant_project_success
    stub_api_success("/participants/#{TEST_LOGIN}/projects/12313", body: { id: 12_313 })
  end

  def stub_participant_points_success
    stub_api_success("/participants/#{TEST_LOGIN}/points", body: { points: 100 })
  end

  def stub_participant_logtime_success
    stub_api_success(
      "/participants/#{TEST_LOGIN}/logtime",
      query: { date: '2026-01-01' },
      body: { weekly_avg_hours: 10 }
    )
  end

  def stub_participant_feedback_success
    stub_api_success("/participants/#{TEST_LOGIN}/feedback", body: { feedback: [] })
  end

  def stub_participant_experience_history_success
    stub_api_success(
      "/participants/#{TEST_LOGIN}/experience-history",
      query: { limit: 50, offset: 0 },
      body: { history: [] }
    )
  end

  def stub_participant_courses_success
    stub_api_success(
      "/participants/#{TEST_LOGIN}/courses",
      query: { limit: 10, offset: 0, status: 'ACCEPTED' },
      body: { courses: [{ id: 42 }] }
    )
  end

  def stub_participant_course_success
    stub_api_success("/participants/#{TEST_LOGIN}/courses/42", body: { id: 42 })
  end

  def stub_participant_coalition_success
    stub_api_success("/participants/#{TEST_LOGIN}/coalition", body: { id: 7 })
  end

  def stub_participant_badges_success
    stub_api_success("/participants/#{TEST_LOGIN}/badges", body: { badges: [] })
  end
end
