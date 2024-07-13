# frozen_string_literal: true

require_relative 'test_helper'

class TestConfig < Minitest::Test
  def setup
    @credentials = { login: 'login', password: 'password' }
  end

  def test_initialize_config
    config = School21::Config.new(**@credentials)

    assert_equal @credentials[:login], config.credentials[:login]
    assert_equal @credentials[:password], config.credentials[:password]
    assert_equal School21::Config::BASE_URL, config.custom_url
    assert_equal School21::Config::AUTH_BASE_URL, config.auth_custom_url
  end

  def test_initialize_config_without_login
    assert_raises ArgumentError, 'login is nil or empty' do
      School21::Config.new(password: @credentials[:password])
    end
  end

  def test_initialize_config_without_password
    assert_raises ArgumentError, 'password is nil or empty' do
      School21::Config.new(login: @credentials[:login])
    end
  end
end
