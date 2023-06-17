# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/grouped_collection_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::GroupedCollectionSelect do
  let(:address) { ::Address.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:address, address, self, {}) }
  let(:city_options) { option_groups_from_collection_for_select(::Country.includes(:cities), :cities, :name, :id, :name) }

  describe "#grouped_collection_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <select name="address[city]" id="address_city">
          #{city_options}
        </select>
      HTML

      actual = form_builder.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_city">City</label>
          <select class="form-select" aria-required="true" required="required" name="address[city]" id="address_city">
            #{blank_option}
            #{city_options}
          </select>
        </div>
      HTML

      actual = form_builder.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="address_city">City</label>
          <select class="form-select" aria-required="true" required="required" placeholder="City" name="address[city]" id="address_city">
            #{blank_option}
            #{city_options}
          </select>
        </div>
      HTML

      actual = form_builder.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="address_city">City</label>
          <div class="col-sm-10">
            <select class="form-select" aria-required="true" required="required" name="address[city]" id="address_city">
              #{blank_option}
              #{city_options}
            </select>
          </div>
        </div>
      HTML

      actual = form_builder.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "sets HTML options" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_city">City</label>
          <select onchange="this.form.submit();" class="form-select" aria-required="true" required="required" name="address[city]" id="address_city">
            #{blank_option}
            #{city_options}
          </select>
        </div>
      HTML

      actual = form_builder.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name, {}, {onchange: "this.form.submit();"}

      expect(actual).to match_html(expected)
    end
  end
end
