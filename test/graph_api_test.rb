# frozen_string_literal: true

require 'test_helper'

describe 'Graph API Test' do
  include AuthStub
  include GraphStub

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

      graph_api_call

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
