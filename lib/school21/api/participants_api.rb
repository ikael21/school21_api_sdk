# frozen_string_literal: true

module School21
  class ParticipantsApi < BaseApi
    def participant(login)
      path = ['/participants/', login].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_workstation(login)
      path = ['/participants/', login, '/workstation'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_projects(login, options: {})
      path = ['/participants/', login, '/projects'].join
      default_options = { limit: 10, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def participant_project(login, project_id)
      path = ['/participants/', login, '/projects/', project_id].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_points(login)
      path = ['/participants/', login, '/points'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_logtime(login, date: nil)
      path = ['/participants/', login, '/logtime'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      new_request.query_param(new_parameter(date, key: :date)) if date.present?

      execute_request(new_request)
    end

    def participant_feedback(login)
      path = ['/participants/', login, '/feedback'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_experience_history(login, options: {})
      path = ['/participants/', login, '/experience-history'].join
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def participant_courses(login, options: {})
      path = ['/participants/', login, '/courses'].join
      default_options = { limit: 10, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def participant_course(login, course_id)
      path = ['/participants/', login, '/courses/', course_id].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_coalition(login)
      path = ['/participants/', login, '/coalition'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_badges(login)
      path = ['/participants/', login, '/badges'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def participant_skills(login)
      path = ['/participants/', login, '/skills'].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end
  end
end
