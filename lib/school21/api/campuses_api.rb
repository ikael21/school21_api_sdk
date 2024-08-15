# frozen_string_literal: true

module School21
  class CampusesApi < BaseApi
    def campuses
      path = '/campuses'
      new_request = new_request_builder(HttpMethod::GET, path, :api_v1)
                    .auth(CoreLibrary::Single.new(SINGLE_AUTH_PARTICIPANT))

      new_api_call_builder
        .request(new_request)
        .response(new_response_handler)
        .execute
    end

    def campuses_participants(campus_id, options: {})
      path = "/campuses/#{campus_id}/participants"
      default_options = { limit: 50, offset: 0 }.merge(options)

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

    def campuses_coalitions(campus_id, options: {})
      path = "/campuses/#{campus_id}/coalitions"
      default_options = { limit: 50, offset: 0 }.merge(options)

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

    def campuses_clusters(campus_id, options: {})
      path = "/campuses/#{campus_id}/clusters"
      default_options = { limit: 50, offset: 0 }.merge(options)

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
