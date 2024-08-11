# frozen_string_literal: true

require 'simplecov'
require 'simplecov-cobertura'
require 'webmock/minitest'

require_relative 'support/stubs/base_stub'
require_relative 'support/stubs/auth_stub'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'school21'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
