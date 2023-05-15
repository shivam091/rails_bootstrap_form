# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "rails/generators"

module RailsBootstrapForm
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "This generator creates an initializer file for configuration of RailsBootstrapForm"

      source_root File.expand_path("../templates", __FILE__)

      def create_initializer_file
        template "install.rb", initializer_path
      end

      private

      def initializer_path
        File.join("config/initializers", "rails_bootstrap_form.rb")
      end
    end
  end
end
