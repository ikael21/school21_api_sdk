# frozen_string_literal: true

module School21
  class CampusesApi < BaseApi
    def campuses
      execute_request(request_with_auth_participant(HttpMethod::GET, '/campuses', :api_v1))
    end

    def campus_participants(campus_id, options: {})
      path = ['/campuses/', campus_id, '/participants'].join
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def campus_coalitions(campus_id, options: {})
      path = ['/campuses/', campus_id, '/coalitions'].join
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def campus_clusters(campus_id, options: {})
      path = ['/campuses/', campus_id, '/clusters'].join
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end
  end
end
