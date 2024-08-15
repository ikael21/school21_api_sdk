# frozen_string_literal: true

module School21
  class ParticipantsApi < BaseApi
    def participants(login)
      path = "/participants/#{login}"
      new_request = new_request_builder(HttpMethod::GET, path, :api_v1)
                    .auth(CoreLibrary::Single.new(SINGLE_AUTH_PARTICIPANT))

      new_api_call_builder
        .request(new_request)
        .response(new_response_handler)
        .execute
    end

    def participants_projects(login, options: {})
      path = "/participants/#{login}/projects"
      default_options = { limit: 10, offset: 0 }.merge(options)

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
