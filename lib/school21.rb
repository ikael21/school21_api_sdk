# frozen_string_literal: true

require 'apimatic_core'
require 'apimatic_faraday_client_adapter'

require 'active_support/all'

require_relative 'school21/auth/access_token'
require_relative 'school21/auth/authorization_header'
require_relative 'school21/auth/bearer_auth_credentials'

require_relative 'school21/api/base_api'
require_relative 'school21/api/participants_api'
require_relative 'school21/api/auth_api'
require_relative 'school21/api/projects_api'

require_relative 'school21/client'
