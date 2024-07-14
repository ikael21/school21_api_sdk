# frozen_string_literal: true

require 'simplecov'
require 'simplecov-cobertura'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'school21'
require 'minitest/autorun'
