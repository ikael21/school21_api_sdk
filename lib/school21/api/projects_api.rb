# frozen_string_literal: true

module School21
  class ProjectsApi < BaseApi
    def project(project_id)
      path = ['/projects/', project_id].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def project_participants(project_id, options: {})
      path = ['/projects/', project_id, '/participants'].join
      default_options = { limit: 10, offset: 0 }
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      options.reverse_merge!(default_options)
      options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end
  end
end
