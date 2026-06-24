# frozen_string_literal: true

require 'test_helper'

describe 'Sales API Test' do
  include AuthStub
  include SalesStub

  with_configured_client do
    it 'calls stub sales success' do
      stubs = [
        stub_token_success,
        stub_sales_success
      ]

      School21.sales_api.sales

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
