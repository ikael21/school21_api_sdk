# frozen_string_literal: true

module ClustersStub
  include BaseStub

  TEST_CLUSTER_ID = 321

  def stub_cluster_map_success
    stub_api_success(
      "/clusters/#{TEST_CLUSTER_ID}/map",
      query: { limit: 50, offset: 0, occupied: true },
      body: { workplaces: [{ id: 1 }] }
    )
  end
end
