# frozen_string_literal: true

module School21
  class CoursesApi < BaseApi
    def course(course_id)
      path = ['/courses/', course_id].join
      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      execute_request(new_request)
    end
  end
end
