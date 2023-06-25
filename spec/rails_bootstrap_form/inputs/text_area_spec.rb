# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/text_area_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::TextArea do
  let(:address) { ::Address.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:address, address, self, {}) }

  describe "#text_area" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <textarea name="address[street]" id="address_street"></textarea>
      HTML

      actual = form_builder.text_area :street, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_street">Street</label>
          <textarea class="form-control" aria-required="true" required="required" name="address[street]" id="address_street"></textarea>
        </div>
      HTML

      actual = form_builder.text_area :street

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="address_street">Street</label>
          <textarea class="form-control" aria-required="true" required="required" placeholder="Street" name="address[street]" id="address_street"></textarea>
        </div>
      HTML

      actual = form_builder.text_area :street, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="address_street">Street</label>
          <div class="col-sm-10">
            <textarea class="form-control" aria-required="true" required="required" name="address[street]" id="address_street"></textarea>
          </div>
        </div>
      HTML

      actual = form_builder.text_area :street, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
