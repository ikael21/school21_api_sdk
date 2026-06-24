# frozen_string_literal: true

require 'test_helper'

describe 'Events API Test' do
  include AuthStub
  include EventsStub

  with_configured_client do
    it 'calls stub events success' do
      stubs = [
        stub_token_success,
        stub_events_success
      ]

      School21.events_api.events(
        from: '2026-01-01T00:00:00Z',
        to: '2026-01-31T23:59:59Z',
        options: { type: 'EXAM' }
      )

      stubs.each { |stub| assert_requested(stub) }
    end

    it 'formats time values as UTC ISO 8601 date-times' do
      stub_token_success
      stub = stub_events_success(
        from: '2026-01-01T00:00:00Z',
        to: '2026-01-31T20:59:59Z'
      )

      School21.events_api.events(
        from: Time.utc(2026, 1, 1),
        to: Time.new(2026, 1, 31, 23, 59, 59, '+03:00'),
        options: { type: 'EXAM' }
      )

      assert_requested(stub)
    end

    it 'rejects plain dates' do
      error = assert_raises(ArgumentError) do
        School21.events_api.events(from: '2026-01-01', to: '2026-01-31')
      end

      assert_match(/ISO 8601 date-time/, error.message)
    end

    it 'rejects invalid event types' do
      error = assert_raises(ArgumentError) do
        School21.events_api.events(
          from: '2026-01-01T00:00:00Z',
          to: '2026-01-31T23:59:59Z',
          options: { type: 'LECTURE' }
        )
      end

      assert_match(/ACTIVITY, EXAM, TEST/, error.message)
    end
  end
end
