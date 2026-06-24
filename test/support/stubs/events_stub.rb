# frozen_string_literal: true

module EventsStub
  include BaseStub

  def stub_events_success(from: '2026-01-01T00:00:00Z', to: '2026-01-31T23:59:59Z')
    stub_api_success(
      '/events',
      query: { from:, to:, limit: 50, offset: 0, type: 'EXAM' },
      body: { events: [{ id: 1 }] }
    )
  end
end
