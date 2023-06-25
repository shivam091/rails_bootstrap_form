# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/datetime_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::DatetimeField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#datetime_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="datetime-local" name="user[interview_datetime]" id="user_interview_datetime" />
      HTML

      actual = form_builder.datetime_field :interview_datetime, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_interview_datetime">Interview date & time</label>
          <input class="form-control" type="datetime-local" name="user[interview_datetime]" id="user_interview_datetime" />
        </div>
      HTML

      actual = form_builder.datetime_field :interview_datetime

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_interview_datetime">Interview date & time</label>
          <input class="form-control" placeholder="Interview date & time" type="datetime-local" name="user[interview_datetime]" id="user_interview_datetime" />
        </div>
      HTML

      actual = form_builder.datetime_field :interview_datetime, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_interview_datetime">Interview date & time</label>
          <div class="col-sm-10">
            <input class="form-control" type="datetime-local" name="user[interview_datetime]" id="user_interview_datetime" />
          </div>
        </div>
      HTML

      actual = form_builder.datetime_field :interview_datetime, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
