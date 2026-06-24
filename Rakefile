# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'minitest/test_task'

Minitest::TestTask.create do |task|
  task.framework = %(require_relative "./test/test_helper")
end

task default: :test
