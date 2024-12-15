# frozen_string_literal: true

module School21
  class CampusesApi < BaseApi
    def campuses
      path = '/campuses'
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end

    def campus_participants(campus_id, options: {})
      path = "/campuses/#{campus_id}/participants"
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def campus_coalitions(campus_id, options: {})
      path = "/campuses/#{campus_id}/coalitions"
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    def campus_clusters(campus_id, options: {})
      path = "/campuses/#{campus_id}/clusters"
      default_options = { limit: 50, offset: 0 }.merge(options)
      new_request = authenticated_request(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end
  end
end
