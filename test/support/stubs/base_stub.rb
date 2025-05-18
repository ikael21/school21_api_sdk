# frozen_string_literal: true

module BaseStub
  BASE_AUTH_URL = 'https://auth.sberclass.ru'
  BASE_API_V1_URL = 'https://edu-api.21-school.ru/services/21-school/api/v1'

  def base_stub_fail(http_method, url)
    stub_request(http_method, url)
      .to_return(status: [500, 'Internal Server Error'])
  end
end
