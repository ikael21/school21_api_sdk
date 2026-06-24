# frozen_string_literal: true

module SalesStub
  include BaseStub

  def stub_sales_success
    stub_api_success('/sales', body: { sales: [{ status: 'OPEN' }] })
  end
end
