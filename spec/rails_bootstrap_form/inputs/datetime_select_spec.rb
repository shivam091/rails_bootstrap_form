# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/datetime_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::DatetimeSelect do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#datetime_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <select id="user_interview_datetime_1i" name="user[interview_datetime(1i)]">
            #{options_range(start: 2018, stop: 2028, selected: 2023)}
          </select>
          <select id="user_interview_datetime_2i" name="user[interview_datetime(2i)]">
            #{options_range(start: 1, stop: 12, selected: 06, months: true)}
          </select>
          <select id="user_interview_datetime_3i" name="user[interview_datetime(3i)]">
            #{options_range(start: 1, stop: 31, selected: 17)}
          </select>
          &mdash;
          <select id="user_interview_datetime_4i" name="user[interview_datetime(4i)]">
            #{options_range(start: "00", stop: "23", selected: "12")}
          </select>
          :
          <select id="user_interview_datetime_5i" name="user[interview_datetime(5i)]">
            #{options_range(start: "00", stop: "59", selected: "00")}
          </select>
        HTML

        actual = form_builder.datetime_select :interview_datetime, bootstrap: {disabled: true}

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in vertical layout" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="mb-3">
            <label class="form-label" for="user_interview_datetime">Interview date &amp; time</label>
            <fieldset class="rails-bootstrap-forms-datetime-select">
              <select id="user_interview_datetime_1i" name="user[interview_datetime(1i)]" class="form-select">
                #{options_range(start: 2018, stop: 2028, selected: 2023)}
              </select>
              <select id="user_interview_datetime_2i" name="user[interview_datetime(2i)]" class="form-select">
                #{options_range(start: 1, stop: 12, selected: 06, months: true)}
              </select>
              <select id="user_interview_datetime_3i" name="user[interview_datetime(3i)]" class="form-select">
                #{options_range(start: 1, stop: 31, selected: 17)}
              </select>
              &mdash;
              <select id="user_interview_datetime_4i" name="user[interview_datetime(4i)]" class="form-select">
                #{options_range(start: "00", stop: "23", selected: "12")}
              </select>
              :
              <select id="user_interview_datetime_5i" name="user[interview_datetime(5i)]" class="form-select">
                #{options_range(start: "00", stop: "59", selected: "00")}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.datetime_select :interview_datetime

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in inline layout" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="col-12">
            <label class="form-label visually-hidden" for="user_interview_datetime">Interview date &amp; time</label>
            <fieldset class="rails-bootstrap-forms-datetime-select">
              <select id="user_interview_datetime_1i" name="user[interview_datetime(1i)]" class="form-select" placeholder="Interview date &amp; time">
                #{options_range(start: 2018, stop: 2028, selected: 2023)}
              </select>
              <select id="user_interview_datetime_2i" name="user[interview_datetime(2i)]" class="form-select" placeholder="Interview date &amp; time">
                #{options_range(start: 1, stop: 12, selected: 06, months: true)}
              </select>
              <select id="user_interview_datetime_3i" name="user[interview_datetime(3i)]" class="form-select" placeholder="Interview date &amp; time">
                #{options_range(start: 1, stop: 31, selected: 17)}
              </select>
              &mdash;
              <select id="user_interview_datetime_4i" name="user[interview_datetime(4i)]" class="form-select" placeholder="Interview date &amp; time">
                #{options_range(start: "00", stop: "23", selected: "12")}
              </select>
              :
              <select id="user_interview_datetime_5i" name="user[interview_datetime(5i)]" class="form-select" placeholder="Interview date &amp; time">
                #{options_range(start: "00", stop: "59", selected: "00")}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.datetime_select :interview_datetime, bootstrap: {layout: :inline}

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in horizontal layout" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="user_interview_datetime">Interview date &amp; time</label>
            <div class="col-sm-10">
              <fieldset class="rails-bootstrap-forms-datetime-select">
                <select id="user_interview_datetime_1i" name="user[interview_datetime(1i)]" class="form-select">
                  #{options_range(start: 2018, stop: 2028, selected: 2023)}
                </select>
                <select id="user_interview_datetime_2i" name="user[interview_datetime(2i)]" class="form-select">
                  #{options_range(start: 1, stop: 12, selected: 06, months: true)}
                </select>
                <select id="user_interview_datetime_3i" name="user[interview_datetime(3i)]" class="form-select">
                  #{options_range(start: 1, stop: 31, selected: 17)}
                </select>
                &mdash;
                <select id="user_interview_datetime_4i" name="user[interview_datetime(4i)]" class="form-select">
                  #{options_range(start: "00", stop: "23", selected: "12")}
                </select>
                :
                <select id="user_interview_datetime_5i" name="user[interview_datetime(5i)]" class="form-select">
                  #{options_range(start: "00", stop: "59", selected: "00")}
                </select>
              </fieldset>
            </div>
          </div>
        HTML

        actual = form_builder.datetime_select :interview_datetime, bootstrap: {layout: :horizontal}

        expect(actual).to match_html(expected)
      end
    end

    it "sets HTML options" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="mb-3">
            <label class="form-label" for="user_interview_datetime">Interview date &amp; time</label>
            <fieldset class="rails-bootstrap-forms-datetime-select">
              <select id="user_interview_datetime_1i" name="user[interview_datetime(1i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: 2018, stop: 2028, selected: 2023)}
              </select>
              <select id="user_interview_datetime_2i" name="user[interview_datetime(2i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: 1, stop: 12, selected: 06, months: true)}
              </select>
              <select id="user_interview_datetime_3i" name="user[interview_datetime(3i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: 1, stop: 31, selected: 17)}
              </select>
              &mdash;
              <select id="user_interview_datetime_4i" name="user[interview_datetime(4i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: "00", stop: "23", selected: "12")}
              </select>
              :
              <select id="user_interview_datetime_5i" name="user[interview_datetime(5i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: "00", stop: "59", selected: "00")}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.datetime_select :interview_datetime, {}, {onchange: "this.form.submit();"}

        expect(actual).to match_html(expected)
      end
    end
  end
end
