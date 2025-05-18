# frozen_string_literal: true

module School21
  class GraphApi < BaseApi
    def graph
      new_request = request_with_auth_participant(HttpMethod::GET, '/graph', :api_v1)

      execute_request(new_request)
    end
  end
end
