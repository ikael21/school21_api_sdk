# frozen_string_literal: true

require 'test_helper'

describe 'Clusters API Test' do
  include AuthStub
  include ClustersStub

  with_configured_client do
    it 'calls stub cluster map success' do
      stubs = [
        stub_token_success,
        stub_cluster_map_success
      ]

      School21.clusters_api.map(ClustersStub::TEST_CLUSTER_ID, options: { occupied: true })

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
