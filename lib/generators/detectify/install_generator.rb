module Detectify
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        copy_file 'detectify.rb', 'config/initializers/detectify.rb'
      end
    end
  end
end
