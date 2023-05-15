# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/configuration_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Configuration do
  let(:config) { described_class.new }

  it "has default form attributes" do
    expect(config.default_form_attributes).to eq({})
  end

  it "allows to set default_form_attributes with custom value" do
    config.default_form_attributes = {role: "form"}

    expect(config.default_form_attributes).to eq({role: "form"})
  end

  it "allows to set default_form_attributes with nil" do
    config.default_form_attributes = nil

    expect(config.default_form_attributes).to eq({})
  end

  it "does not allow to set default_form_attributes with unsupported value" do
    expect {
      config.default_form_attributes = [1, 2, 3]
    }.to raise_error(ArgumentError, "Unsupported default_form_attributes [1, 2, 3]")
  end
end
