# frozen_string_literal: true

require 'time'

module School21
  class EventsApi < BaseApi
    EVENT_TYPES = %w[ACTIVITY EXAM TEST].freeze

    def events(from:, to:, options: {})
      path = '/events'
      default_options = {
        limit: 50,
        offset: 0
      }.merge(options).merge(
        from: formatted_date_time(from, :from),
        to: formatted_date_time(to, :to)
      ).compact

      validate_event_type(default_options[:type])

      new_request = request_with_auth_participant(HttpMethod::GET, path, :api_v1)

      default_options.each do |key, value|
        new_request.query_param(new_parameter(value, key:))
      end

      execute_request(new_request)
    end

    private

    def formatted_date_time(value, name)
      case value
      when Time
        value.utc.iso8601
      when DateTime
        value.to_time.utc.iso8601
      when String
        Time.iso8601(value)
        value
      else
        raise ArgumentError, "#{name} must be an ISO 8601 date-time string, Time, or DateTime"
      end
    rescue ArgumentError
      raise ArgumentError, "#{name} must be an ISO 8601 date-time, for example: 2024-01-23T00:00:00Z"
    end

    def validate_event_type(type)
      return if type.blank? || EVENT_TYPES.include?(type)

      raise ArgumentError, "type must be one of: #{EVENT_TYPES.join(', ')}"
    end
  end
end
