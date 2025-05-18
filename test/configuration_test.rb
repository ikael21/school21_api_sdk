# frozen_string_literal: true

require 'test_helper'

describe 'Configuration test' do
  include SharedData

  it 'successfully configures client' do
    School21.configure do |config|
      config.credentials = credentials_fixtures
      config.enable_logging = false
    end

    assert_equal credentials_fixtures, School21.config.credentials
    refute School21.config.enable_logging
  end
end
