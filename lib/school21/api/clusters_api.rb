# frozen_string_literal: true

module School21
  class ClustersApi < BaseApi
    def clusters_map(cluster_id, options: {})
      path = "/clusters/#{cluster_id}/map"
      default_options = { limit: 50, offset: 0, occupied: true }.merge(options)

      new_request = new_request_builder(HttpMethod::GET, path, :api_v1)
                    .auth(CoreLibrary::Single.new(SINGLE_AUTH_PARTICIPANT))

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      new_api_call_builder
        .request(new_request)
        .response(new_response_handler)
        .execute
    end
  end
end
