# frozen_string_literal: true

module School21
  class SalesApi < BaseApi
    def sales
      execute_request(request_with_auth_participant(HttpMethod::GET, '/sales', :api_v1))
    end
  end
end
