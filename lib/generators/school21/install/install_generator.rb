# frozen_string_literal: true

module School21
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Creates a School21 initializer'

      def copy_initializer
        template 'school21.rb.tt', 'config/initializers/school21.rb'
      end
    end
  end
end
