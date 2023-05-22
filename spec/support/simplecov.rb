# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

SimpleCov.start "rails" do
  add_filter "spec/"
  add_filter ".github/"
  add_filter "lib/generators/templates/"
  add_filter "lib/rails_bootstrap_form/version"
end
