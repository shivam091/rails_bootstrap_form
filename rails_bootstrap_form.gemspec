# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require_relative "lib/rails_bootstrap_form/version"

Gem::Specification.new do |spec|
  spec.name = "rails_bootstrap_form"
  spec.version = RailsBootstrapForm::VERSION
  spec.authors = ["Harshal LADHE (shivam091)"]
  spec.email = ["harshal.ladhe.1@gmail.com"]

  spec.summary = "Form builder and form helpers using Bootstrap 5 styles"
  spec.description = "Rails form helpers and form builder extensions that make it super easy to build Bootstrap 5 forms."
  spec.homepage = "https://github.com/shivam091/rails_bootstrap_form"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/shivam091/rails_bootstrap_form"
  spec.metadata["changelog_uri"] = "https://github.com/shivam091/rails_bootstrap_form/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("generator_spec")
  spec.add_dependency("actionpack", RailsBootstrapForm::REQUIRED_RAILS_VERSION)
  spec.add_dependency("activemodel", RailsBootstrapForm::REQUIRED_RAILS_VERSION)
end
