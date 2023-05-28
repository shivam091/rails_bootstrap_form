# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form_spec.rb

RSpec.describe RailsBootstrapForm do
  it "has a valid version number" do
    expect(RailsBootstrapForm::VERSION).to eq("0.8.2")
  end

  it "has a valid rails version number" do
    expect(RailsBootstrapForm::REQUIRED_RAILS_VERSION).to eq("~> 7.0")
  end
end
