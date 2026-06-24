# frozen_string_literal: true

module CampusesStub
  include BaseStub

  TEST_CAMPUS_ID = '96098f4b-5708-4c42-a62c-6893419169b3'

  def stub_campuses_success
    stub_api_success('/campuses', body: { campuses: [{ id: TEST_CAMPUS_ID }] })
  end

  def stub_campus_participants_success
    stub_api_success(
      "/campuses/#{TEST_CAMPUS_ID}/participants",
      query: { limit: 50, offset: 0 },
      body: { logins: ['test_login'] }
    )
  end

  def stub_campus_coalitions_success
    stub_api_success(
      "/campuses/#{TEST_CAMPUS_ID}/coalitions",
      query: { limit: 50, offset: 0 },
      body: { coalitions: [{ id: 1 }] }
    )
  end

  def stub_campus_clusters_success
    stub_api_success(
      "/campuses/#{TEST_CAMPUS_ID}/clusters",
      query: {},
      body: { clusters: [{ id: 1 }] }
    )
  end
end
