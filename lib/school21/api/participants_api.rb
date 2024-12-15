# frozen_string_literal: true

module School21
  class ParticipantsApi < BaseApi
    def participant(login)
      path = "/participants/#{login}"
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_projects(login, options: {})
      path = "/participants/#{login}/projects"
      default_options = { limit: 10, offset: 0 }.merge(options)
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def participant_project(login, project_id)
      path = "/participants/#{login}/projects/#{project_id}"
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end
  end
end
