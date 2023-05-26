# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/bootstrap_form_options_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::BootstrapFormOptions do

  describe "#set_defaults" do
    let(:options) { described_class.new }

    it "sets default values of bootstrap form options" do
      expect(options.layout).to eq("vertical")
      expect(options.field_class).to eq("form-control")
      expect(options.additional_field_class).to be_nil
      expect(options.help_text).to be_nil
      expect(options.label_text).to be_nil
      expect(options.skip_label).to be_falsy
      expect(options.hide_label).to be_falsy
      expect(options.hide_class).to eq("visually-hidden")
      expect(options.label_class).to eq("form-label")
      expect(options.additional_label_class).to be_nil
      expect(options.prepend).to be_nil
      expect(options.append).to be_nil
      expect(options.additional_input_group_class).to be_nil
      expect(options.floating).to be_falsy
      expect(options.static_field_class).to eq("form-control-plaintext")
      expect(options.switch).to be_falsy
      expect(options.wrapper_options).to eq({})
      expect(options.size).to be_nil
      expect(options.inline).to be_falsy
      expect(options.label_col_class).to eq("col-form-label")
      expect(options.label_col_wrapper_class).to eq("col-sm-2")
      expect(options.field_col_wrapper_class).to eq("col-sm-10")
      expect(options.render_as_button).to be_falsy
    end
  end

  describe "#set_bootstrap_form_options" do
    let(:options) do
      options = described_class.new(
        layout: "horizontal",
        field_class: "form-select",
        additional_field_class: "custom-class",
        help_text: "This is help text",
        label_text: "Test label",
        skip_label: false,
        hide_label: true,
        hide_class: "sr-only",
        label_class: "col-form-label",
        additional_label_class: "form-label",
        prepend: "$",
        append: "0.0",
        additional_input_group_class: "custom-input-group",
        floating: true,
        static_field_class: "form-control-plaintext",
        switch: true,
        wrapper_options: {data: {controller: "hello"}},
        size: :sm,
        inline: true,
        label_col_class: "col-form-label",
        label_col_wrapper_class: "col-sm-3",
        field_col_wrapper_class: "col-sm-9",
        render_as_button: true
      )
    end

    it "sets custom values of bootstrap form options" do
      expect(options.layout).to eq("horizontal")
      expect(options.field_class).to eq("form-select")
      expect(options.additional_field_class).to eq("custom-class")
      expect(options.help_text).to eq("This is help text")
      expect(options.label_text).to eq("Test label")
      expect(options.skip_label).to be_falsy
      expect(options.hide_label).to be_truthy
      expect(options.hide_class).to eq("sr-only")
      expect(options.label_class).to eq("col-form-label")
      expect(options.additional_label_class).to eq("form-label")
      expect(options.prepend).to eq("$")
      expect(options.append).to eq("0.0")
      expect(options.additional_input_group_class).to eq("custom-input-group")
      expect(options.floating).to be_truthy
      expect(options.static_field_class).to eq("form-control-plaintext")
      expect(options.switch).to be_truthy
      expect(options.wrapper_options).to eq(data: {controller: "hello"})
      expect(options.size).to eq(:sm)
      expect(options.inline).to be_truthy
      expect(options.label_col_class).to eq("col-form-label")
      expect(options.label_col_wrapper_class).to eq("col-sm-3")
      expect(options.field_col_wrapper_class).to eq("col-sm-9")
      expect(options.render_as_button).to be_truthy
    end
  end

  describe "#scoped" do
    it "sets scoped values of bootstrap form options" do
      options = described_class.new
      expect(options.layout_horizontal?).to be_falsy

      scoped_options = options.scoped(layout: :horizontal)
      expect(scoped_options.layout_horizontal?).to be_truthy
    end
  end

  describe "#vertical?" do
    it "checks whether form has vertical layout" do
      options = described_class.new
      expect(options.layout_vertical?).to be_truthy
    end
  end

  describe "#horizontal?" do
    it "checks whether form has horizontal layout" do
      options = described_class.new
      expect(options.layout_horizontal?).to be_falsy

      options = described_class.new(layout: :horizontal)
      expect(options.layout_horizontal?).to be_truthy
    end
  end

  describe "#inline?" do
    it "checks whether form has inline layout" do
      options = described_class.new
      expect(options.layout_inline?).to be_falsy

      options = described_class.new(layout: :inline)
      expect(options.layout_inline?).to be_truthy
    end
  end

  describe "#floating?" do
    it "checks whether floating option is false" do
      options = described_class.new
      expect(options.floating?).to be_falsy
    end
  end

  describe "#inline?" do
    it "checks whether inline option is false" do
      options = described_class.new
      expect(options.inline?).to be_falsy
    end
  end

  describe "#switch?" do
    it "checks whether switch option is false" do
      options = described_class.new
      expect(options.switch?).to be_falsy
    end
  end

  describe "#skip_label?" do
    it "checks whether skip_label option is false" do
      options = described_class.new
      expect(options.skip_label?).to be_falsy
    end
  end

  describe "#hide_label?" do
    it "checks whether hide_label option is false" do
      options = described_class.new
      expect(options.hide_label?).to be_falsy
    end
  end

  describe "#render_as_button?" do
    it "checks whether render_as_button option is false" do
      options = described_class.new
      expect(options.render_as_button?).to be_falsy
    end
  end
end
