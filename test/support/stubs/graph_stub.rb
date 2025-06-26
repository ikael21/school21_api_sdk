# frozen_string_literal: true

module GraphStub
  include BaseStub

  STUBBED_GRAPH_URL = [BASE_API_V1_URL, '/graph'].join

  def stub_graph_success
    stub_request(:get, STUBBED_GRAPH_URL)
      .to_return_json(body: { data: { user: { login: 'test_user' } } }) # Example success response
  end

  def stub_graph_fail
    base_stub_fail(:get, STUBBED_GRAPH_URL)
  end
end
