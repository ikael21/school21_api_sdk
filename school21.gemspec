# frozen_string_literal: true

require_relative 'lib/school21/version'

Gem::Specification.new do |spec|
  spec.name = 'school21_api_sdk'
  spec.version = School21::VERSION
  spec.authors = ['Anton Yudin']
  spec.email = ['ikael.fess@gmail.com']

  spec.summary = 'School21 API SDK'
  spec.description = ''

  spec.licenses = ['Nonstandard']
  spec.homepage = 'https://github.com/ikael21/school21_api_sdk'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.required_ruby_version = '>= 3.3'
  spec.require_paths = ['lib']
  spec.files = Dir['{bin,lib,test}/**/*', 'README*', 'LICENSE*']

  spec.add_dependency('activesupport')
  spec.add_dependency('apimatic_core')
  spec.add_dependency('apimatic_core_interfaces')
  spec.add_dependency('apimatic_faraday_client_adapter')
  spec.add_dependency('base64')
  spec.add_dependency('semantic_logger')
end
