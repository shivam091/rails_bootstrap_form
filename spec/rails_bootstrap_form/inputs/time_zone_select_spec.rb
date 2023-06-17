# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/time_zone_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::TimeZoneSelect do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }
  let(:time_zone_options) { time_zone_options_for_select }
  let(:time_zone_options_with_selected) { time_zone_options_for_select(selected: ["Asia/Kolkata"]) }

  describe "#time_zone_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <select name="user[interview_time]" id="user_interview_time">
          #{time_zone_options}
        </select>
      HTML

      actual = form_builder.time_zone_select :interview_time, nil, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_interview_time">Interview time</label>
          <select class="form-select" name="user[interview_time]" id="user_interview_time">
            #{time_zone_options}
          </select>
        </div>
      HTML

      actual = form_builder.time_zone_select :interview_time, nil

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_interview_time">Interview time</label>
          <select class="form-select" placeholder="Interview time" name="user[interview_time]" id="user_interview_time">
            #{time_zone_options}
          </select>
        </div>
      HTML

      actual = form_builder.time_zone_select :interview_time, nil, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_interview_time">Interview time</label>
          <div class="col-sm-10">
            <select class="form-select" name="user[interview_time]" id="user_interview_time">
              #{time_zone_options}
            </select>
          </div>
        </div>
      HTML

      actual = form_builder.time_zone_select :interview_time, nil, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "sets selected option" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_interview_time">Interview time</label>
          <select class="form-select" name="user[interview_time]" id="user_interview_time">
            #{time_zone_options_with_selected}
          </select>
        </div>
      HTML

      actual = form_builder.time_zone_select :interview_time, nil, default: "Asia/Kolkata"

      expect(actual).to match_html(expected)
    end

    it "sets HTML options" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_interview_time">Interview time</label>
          <select onchange="this.form.submit();" class="form-select" name="user[interview_time]" id="user_interview_time">
            #{time_zone_options}
          </select>
        </div>
      HTML

      actual = form_builder.time_zone_select :interview_time, nil, {}, {onchange: "this.form.submit();"}

      expect(actual).to match_html(expected)
    end
  end
end
