# frozen_string_literal: true

module School21
  class ClustersApi < BaseApi
    def map(cluster_id, options: {})
      path = ['/clusters/', cluster_id, '/map'].join
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end
  end
end
