# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/time_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::TimeField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#time_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="time" name="user[interview_time]" id="user_interview_time" />
      HTML

      actual = form_builder.time_field :interview_time, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_interview_time">Interview time</label>
          <input class="form-control" type="time" name="user[interview_time]" id="user_interview_time" />
        </div>
      HTML

      actual = form_builder.time_field :interview_time

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_interview_time">Interview time</label>
          <input class="form-control" placeholder="Interview time" type="time" name="user[interview_time]" id="user_interview_time" />
        </div>
      HTML

      actual = form_builder.time_field :interview_time, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_interview_time">Interview time</label>
          <div class="col-sm-10">
            <input class="form-control" type="time" name="user[interview_time]" id="user_interview_time" />
          </div>
        </div>
      HTML

      actual = form_builder.time_field :interview_time, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
