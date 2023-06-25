# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/time_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::TimeSelect do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#time_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <input type="hidden" id="user_interview_time_1i" name="user[interview_time(1i)]" value="2023" #{autocomplete_attr} />
          <input type="hidden" id="user_interview_time_2i" name="user[interview_time(2i)]" value="6" #{autocomplete_attr} />
          <input type="hidden" id="user_interview_time_3i" name="user[interview_time(3i)]" value="17" #{autocomplete_attr} />
          <select id="user_interview_time_4i" name="user[interview_time(4i)]">
            #{options_range(start: "00", stop: "23", selected: "12")}
          </select>
          :
          <select id="user_interview_time_5i" name="user[interview_time(5i)]">
            #{options_range(start: "00", stop: "59", selected: "00")}
          </select>
        HTML

        actual = form_builder.time_select :interview_time, bootstrap: {disabled: true}

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in vertical layout" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="mb-3">
            <label class="form-label" for="user_interview_time">Interview time</label>
            <fieldset class="rails-bootstrap-forms-time-select">
              <input type="hidden" id="user_interview_time_1i" name="user[interview_time(1i)]" value="2023" #{autocomplete_attr} />
              <input type="hidden" id="user_interview_time_2i" name="user[interview_time(2i)]" value="6" #{autocomplete_attr} />
              <input type="hidden" id="user_interview_time_3i" name="user[interview_time(3i)]" value="17" #{autocomplete_attr} />
              <select id="user_interview_time_4i" name="user[interview_time(4i)]" class="form-select">
                #{options_range(start: "00", stop: "23", selected: "12")}
              </select>
              :
              <select id="user_interview_time_5i" name="user[interview_time(5i)]" class="form-select">
                #{options_range(start: "00", stop: "59", selected: "00")}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.time_select :interview_time

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in inline layout" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="col-12">
            <label class="form-label visually-hidden" for="user_interview_time">Interview time</label>
            <fieldset class="rails-bootstrap-forms-time-select">
              <input type="hidden" id="user_interview_time_1i" name="user[interview_time(1i)]" value="2023" #{autocomplete_attr} />
              <input type="hidden" id="user_interview_time_2i" name="user[interview_time(2i)]" value="6" #{autocomplete_attr} />
              <input type="hidden" id="user_interview_time_3i" name="user[interview_time(3i)]" value="17" #{autocomplete_attr} />
              <select id="user_interview_time_4i" name="user[interview_time(4i)]" class="form-select" placeholder="Interview time">
                #{options_range(start: "00", stop: "23", selected: "12")}
              </select>
              :
              <select id="user_interview_time_5i" name="user[interview_time(5i)]" class="form-select" placeholder="Interview time">
                #{options_range(start: "00", stop: "59", selected: "00")}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.time_select :interview_time, bootstrap: {layout: :inline}

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in horizontal layout" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="user_interview_time">Interview time</label>
            <div class="col-sm-10">
              <fieldset class="rails-bootstrap-forms-time-select">
                <input type="hidden" id="user_interview_time_1i" name="user[interview_time(1i)]" value="2023" #{autocomplete_attr} />
                <input type="hidden" id="user_interview_time_2i" name="user[interview_time(2i)]" value="6" #{autocomplete_attr} />
                <input type="hidden" id="user_interview_time_3i" name="user[interview_time(3i)]" value="17" #{autocomplete_attr} />
                <select id="user_interview_time_4i" name="user[interview_time(4i)]" class="form-select">
                  #{options_range(start: "00", stop: "23", selected: "12")}
                </select>
                :
                <select id="user_interview_time_5i" name="user[interview_time(5i)]" class="form-select">
                  #{options_range(start: "00", stop: "59", selected: "00")}
                </select>
              </fieldset>
            </div>
          </div>
        HTML

        actual = form_builder.time_select :interview_time, bootstrap: {layout: :horizontal}

        expect(actual).to match_html(expected)
      end
    end

    it "sets HTML options" do
      travel_to(Time.utc(2023, 06, 17, 12, 0, 0)) do
        expected = <<~HTML
          <div class="mb-3">
            <label class="form-label" for="user_interview_time">Interview time</label>
            <fieldset class="rails-bootstrap-forms-time-select">
              <input type="hidden" id="user_interview_time_1i" name="user[interview_time(1i)]" value="2023" #{autocomplete_attr} />
              <input type="hidden" id="user_interview_time_2i" name="user[interview_time(2i)]" value="6" #{autocomplete_attr} />
              <input type="hidden" id="user_interview_time_3i" name="user[interview_time(3i)]" value="17" #{autocomplete_attr} />
              <select id="user_interview_time_4i" name="user[interview_time(4i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: "00", stop: "23", selected: "12")}
              </select>
              :
              <select id="user_interview_time_5i" name="user[interview_time(5i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: "00", stop: "59", selected: "00")}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.time_select :interview_time, {}, {onchange: "this.form.submit();"}

        expect(actual).to match_html(expected)
      end
    end
  end
end
