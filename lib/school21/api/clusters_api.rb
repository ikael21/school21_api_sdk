# frozen_string_literal: true

module School21
  class ClustersApi < BaseApi
    def cluster_map(cluster_id, options: {})
      path = "/clusters/#{cluster_id}/map"
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end
  end
end
