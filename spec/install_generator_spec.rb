# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/install_generator_spec.rb

require "spec_helper"
require "generator_spec"

require "generators/rails_bootstrap_form/install_generator"

RSpec.describe RailsBootstrapForm::Generators::InstallGenerator, type: :generator do
  destination File.expand_path(test_directory_path, __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it "creates an initializer file for RailsBootstrapForm" do
    assert_file("config/initializers/rails_bootstrap_form.rb")
  end

  it "matches the content of initializer file" do
    assert_file("config/initializers/rails_bootstrap_form.rb") do |content|
      assert_includes(content,
        <<-STRING.strip_heredoc
          RailsBootstrapForm.configure do |config|
            # to make forms non-compliant with W3C.
            config.default_form_attributes = {role: "form", novalidate: true}
          end
        STRING
      )
    end
  end
end
