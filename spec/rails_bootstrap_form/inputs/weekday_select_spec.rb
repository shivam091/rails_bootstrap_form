# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/weekday_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::WeekdaySelect do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }
  let(:weekday_options) { weekday_options_for_select }
  let(:weekday_options_with_selected) { weekday_options_for_select("Monday") }

  describe "#weekday_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <select name="user[weekly_off]" id="user_weekly_off">
          #{weekday_options}
        </select>
      HTML

      actual = form_builder.weekday_select :weekly_off, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_weekly_off">Week off</label>
          <select class="form-select" name="user[weekly_off]" id="user_weekly_off">
            #{weekday_options}
          </select>
        </div>
      HTML

      actual = form_builder.weekday_select :weekly_off

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_weekly_off">Week off</label>
          <select class="form-select" placeholder="Week off" name="user[weekly_off]" id="user_weekly_off">
            #{weekday_options}
          </select>
        </div>
      HTML

      actual = form_builder.weekday_select :weekly_off, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_weekly_off">Week off</label>
          <div class="col-sm-10">
            <select class="form-select" name="user[weekly_off]" id="user_weekly_off">
              #{weekday_options}
            </select>
          </div>
        </div>
      HTML

      actual = form_builder.weekday_select :weekly_off, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "sets selected option" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_weekly_off">Week off</label>
          <select class="form-select" name="user[weekly_off]" id="user_weekly_off">
            #{weekday_options_with_selected}
          </select>
        </div>
      HTML

      actual = form_builder.weekday_select :weekly_off, {selected: "Monday"}

      expect(actual).to match_html(expected)
    end

    it "sets HTML options" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_weekly_off">Week off</label>
          <select onchange="this.form.submit();" class="form-select" name="user[weekly_off]" id="user_weekly_off">
            #{weekday_options}
          </select>
        </div>
      HTML

      actual = form_builder.weekday_select :weekly_off, {}, {onchange: "this.form.submit();"}

      expect(actual).to match_html(expected)
    end
  end
end
