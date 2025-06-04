# frozen_string_literal: true

require 'test_helper'
require 'support/stubs/graph_stub' # Ensure GraphStub is required

describe 'Graph API Test' do
  include AuthStub
  include GraphStub # Include the new GraphStub

  with_configured_client do
    let(:graph_api_call) do
      School21.graph_api.graph
    end

    it 'calls stub graph success' do
      stubs = [
        stub_token_success,
        stub_graph_success
      ]

      graph_api_call

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'calls stub graph fail' do
      stubs = [
        stub_token_success,
        stub_graph_fail
      ]

      graph_api_call # Call the API

      stubs.each { |stub| assert_requested(stub) }
      # Example: Assert response status code if the BaseApi or client handles it
      # assert_equal(500, response.status_code) # This depends on actual error handling
    end
  end
end
