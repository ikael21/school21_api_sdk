# frozen_string_literal: true

require 'test_helper'

describe 'Client Test' do
  include AuthStub

  before do
    @login = 'login'
    @password = 'password'
  end

  let(:valid_init_client) do
    School21::Client.configure do |config|
      config.credentials = { login: @login, password: @password }
      config.enable_logging = false
    end
  end

  let(:init_client_without_login) do
    School21::Client.configure do |config|
      config.credentials = { login: nil, password: @password }
      config.enable_logging = false
    end
  end

  let(:init_client_without_password) do
    School21::Client.configure do |config|
      config.credentials = { login: @login, password: nil }
      config.enable_logging = false
    end
  end

  it 'successfully stubs client auth' do
    stub = stub_token

    valid_init_client.authenticate!

    assert_requested(stub)
  end

  it 'raises an exception without login' do
    stub = stub_token

    assert_raises(RuntimeError, "Login can't be nil or empty") do
      init_client_without_login
    end

    refute_requested(stub)
  end

  it 'raises an exception without password' do
    stub = stub_token

    assert_raises(RuntimeError, "Password can't be nil or empty") do
      init_client_without_password
    end

    refute_requested(stub)
  end
end
