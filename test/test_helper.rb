# frozen_string_literal: true

require 'simplecov'
require 'simplecov-cobertura'
require 'webmock/minitest'
require 'debug'

require_relative 'support/shared_data'

require_relative 'support/stubs/base_stub'
require_relative 'support/stubs/auth_stub'
require_relative 'support/stubs/participants_stub'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'school21'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

module Minitest
  class Spec
    include SharedData

    def self.with_configured_client(&block)
      describe 'with configured client' do
        before do
          School21.reset!
          School21.configure { |c| c.credentials = credentials_fixtures }
        end

        class_eval(&block)
      end
    end
  end
end
