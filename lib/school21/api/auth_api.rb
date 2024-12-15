# frozen_string_literal: true

module School21
  class AuthApi < BaseApi
    def token(login:, password:)
      new_request = new_request_builder(HttpMethod::POST, '/token', :auth)
                    .form_param(new_parameter(login, key: :username))
                    .form_param(new_parameter(password, key: :password))
                    .form_param(new_parameter('password', key: :grant_type))
                    .form_param(new_parameter('s21-open-api', key: :client_id))

      execute_request(new_request)
    end
  end
end
