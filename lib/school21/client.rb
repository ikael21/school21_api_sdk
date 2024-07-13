# frozen_string_literal: true

require_relative 'config'

module School21
  class Client
    def initialize(login: nil, password: nil)
      @config = Config.new(login, password)
    end
  end
end
