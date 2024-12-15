# frozen_string_literal: true

module School21
  class ProjectsApi < BaseApi
    def project(project_id)
      path = "/projects/#{project_id}"
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def project_participants(project_id, options: {})
      path = "/projects/#{project_id}/participants"
      default_options = { limit: 10, offset: 0 }.merge(options)
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end
  end
end
