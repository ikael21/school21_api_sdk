# frozen_string_literal: true

module BaseStub
  BASE_AUTH_URL = 'https://auth.21-school.ru'
  BASE_API_V1_URL = 'https://platform.21-school.ru/services/21-school/api/v1'

  def base_api_url(path)
    [BASE_API_V1_URL, path].join
  end

  def base_stub_fail(http_method, url)
    stub_request(http_method, url)
      .to_return(status: [500, 'Internal Server Error'])
  end

  def stub_api_success(path, query: nil, body: {})
    stub = stub_request(:get, base_api_url(path))
    stub = stub.with(query: stringify_query(query)) if query

    stub.to_return_json(body:)
  end

  def stringify_query(query)
    query.transform_values(&:to_s)
  end
end
