# frozen_string_literal: true

module ProjectsStub
  include BaseStub

  TEST_PROJECT_ID = 12_313

  def stub_project_success
    stub_api_success("/projects/#{TEST_PROJECT_ID}", body: { id: TEST_PROJECT_ID })
  end

  def stub_project_participants_success
    stub_api_success(
      "/projects/#{TEST_PROJECT_ID}/participants",
      query: { limit: 50, offset: 0 },
      body: { logins: ['test_login'] }
    )
  end
end
