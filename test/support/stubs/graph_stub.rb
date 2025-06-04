# frozen_string_literal: true

module GraphStub
  include BaseStub

  STUBBED_GRAPH_URL = [BASE_API_V1_URL, '/graph'].join

  def stub_graph_success
    stub_request(:get, STUBBED_GRAPH_URL)
      .to_return_json(body: { data: { user: { login: 'test_user' } } }) # Example success response
  end

  def stub_graph_fail
    stub_request(:get, STUBBED_GRAPH_URL)
      .to_return(status: [500, 'Internal Server Error'])
  end
end
