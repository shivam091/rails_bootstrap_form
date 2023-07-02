# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/date_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::DateSelect do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#date_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <select id="user_interview_date_1i" name="user[interview_date(1i)]">
            #{options_range(start: 2018, stop: 2028, selected: 2023)}
          </select>
          <select id="user_interview_date_2i" name="user[interview_date(2i)]">
            #{options_range(start: 1, stop: 12, selected: 06, months: true)}
          </select>
          <select id="user_interview_date_3i" name="user[interview_date(3i)]">
            #{options_range(start: 1, stop: 31, selected: 17)}
          </select>
        HTML

        actual = form_builder.date_select :interview_date, bootstrap: {disabled: true}

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in vertical layout" do
      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <div class="mb-3">
            <label class="form-label" for="user_interview_date">Interview date</label>
            <fieldset class="rails-bootstrap-forms-date-select">
              <select id="user_interview_date_1i" name="user[interview_date(1i)]" class="form-select">
                #{options_range(start: 2018, stop: 2028, selected: 2023)}
              </select>
              <select id="user_interview_date_2i" name="user[interview_date(2i)]" class="form-select">
                #{options_range(start: 1, stop: 12, selected: 06, months: true)}
              </select>
              <select id="user_interview_date_3i" name="user[interview_date(3i)]" class="form-select">
                #{options_range(start: 1, stop: 31, selected: 17)}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.date_select :interview_date

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in inline layout" do
      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <div class="col-12">
            <label class="form-label visually-hidden" for="user_interview_date">Interview date</label>
            <fieldset class="rails-bootstrap-forms-date-select">
              <select id="user_interview_date_1i" name="user[interview_date(1i)]" class="form-select" placeholder="Interview date">
                #{options_range(start: 2018, stop: 2028, selected: 2023)}
              </select>
              <select id="user_interview_date_2i" name="user[interview_date(2i)]" class="form-select" placeholder="Interview date">
                #{options_range(start: 1, stop: 12, selected: 06, months: true)}
              </select>
              <select id="user_interview_date_3i" name="user[interview_date(3i)]" class="form-select" placeholder="Interview date">
                #{options_range(start: 1, stop: 31, selected: 17)}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.date_select :interview_date, bootstrap: {layout: :inline}

        expect(actual).to match_html(expected)
      end
    end

    it "renders correctly in horizontal layout" do
      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="user_interview_date">Interview date</label>
            <div class="col-sm-10">
              <fieldset class="rails-bootstrap-forms-date-select">
                <select id="user_interview_date_1i" name="user[interview_date(1i)]" class="form-select">
                  #{options_range(start: 2018, stop: 2028, selected: 2023)}
                </select>
                <select id="user_interview_date_2i" name="user[interview_date(2i)]" class="form-select">
                  #{options_range(start: 1, stop: 12, selected: 06, months: true)}
                </select>
                <select id="user_interview_date_3i" name="user[interview_date(3i)]" class="form-select">
                  #{options_range(start: 1, stop: 31, selected: 17)}
                </select>
              </fieldset>
            </div>
          </div>
        HTML

        actual = form_builder.date_select :interview_date, bootstrap: {layout: :horizontal}

        expect(actual).to match_html(expected)
      end
    end

    it "sets HTML options" do
      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <div class="mb-3">
            <label class="form-label" for="user_interview_date">Interview date</label>
            <fieldset class="rails-bootstrap-forms-date-select">
              <select id="user_interview_date_1i" name="user[interview_date(1i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: 2018, stop: 2028, selected: 2023)}
              </select>
              <select id="user_interview_date_2i" name="user[interview_date(2i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: 1, stop: 12, selected: 06, months: true)}
              </select>
              <select id="user_interview_date_3i" name="user[interview_date(3i)]" onchange="this.form.submit();" class="form-select">
                #{options_range(start: 1, stop: 31, selected: 17)}
              </select>
            </fieldset>
          </div>
        HTML

        actual = form_builder.date_select :interview_date, {}, {onchange: "this.form.submit();"}

        expect(actual).to match_html(expected)
      end
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:interview_date, :blank)

      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <form novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
            <div class="mb-3">
              <label class="form-label is-invalid" for="user_interview_date">Interview date</label>
              <fieldset class="rails-bootstrap-forms-date-select">
                <select id="user_interview_date_1i" name="user[interview_date(1i)]" class="form-select is-invalid">
                  #{options_range(start: 2018, stop: 2028, selected: 2023)}
                </select>
                <select id="user_interview_date_2i" name="user[interview_date(2i)]" class="form-select is-invalid">
                  #{options_range(start: 1, stop: 12, selected: 06, months: true)}
                </select>
                <select id="user_interview_date_3i" name="user[interview_date(3i)]" class="form-select is-invalid">
                  #{options_range(start: 1, stop: 31, selected: 17)}
                </select>
              </fieldset>
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </form>
        HTML

        actual = bootstrap_form_with(model: user, url: "/test") do |form|
          concat(form.date_select(:interview_date))
        end

        expect(actual).to match_html(expected)
      end
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:interview_date, :blank)

      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <form novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
            <div class="col-12">
              <label class="form-label visually-hidden is-invalid" for="user_interview_date">Interview date</label>
              <fieldset class="rails-bootstrap-forms-date-select">
                <select id="user_interview_date_1i" name="user[interview_date(1i)]" class="form-select is-invalid" placeholder="Interview date">
                  #{options_range(start: 2018, stop: 2028, selected: 2023)}
                </select>
                <select id="user_interview_date_2i" name="user[interview_date(2i)]" class="form-select is-invalid" placeholder="Interview date">
                  #{options_range(start: 1, stop: 12, selected: 06, months: true)}
                </select>
                <select id="user_interview_date_3i" name="user[interview_date(3i)]" class="form-select is-invalid" placeholder="Interview date">
                  #{options_range(start: 1, stop: 31, selected: 17)}
                </select>
              </fieldset>
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </form>
        HTML

        actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
          concat(form.date_select(:interview_date))
        end

        expect(actual).to match_html(expected)
      end
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:interview_date, :blank)

      travel_to(Time.utc(2023, 06, 17)) do
        expected = <<~HTML
          <form novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
            <div class="row mb-3">
              <label class="col-form-label col-sm-2 is-invalid" for="user_interview_date">Interview date</label>
              <div class="col-sm-10">
                <fieldset class="rails-bootstrap-forms-date-select">
                  <select id="user_interview_date_1i" name="user[interview_date(1i)]" class="form-select is-invalid">
                    #{options_range(start: 2018, stop: 2028, selected: 2023)}
                  </select>
                  <select id="user_interview_date_2i" name="user[interview_date(2i)]" class="form-select is-invalid">
                    #{options_range(start: 1, stop: 12, selected: 06, months: true)}
                  </select>
                  <select id="user_interview_date_3i" name="user[interview_date(3i)]" class="form-select is-invalid">
                    #{options_range(start: 1, stop: 31, selected: 17)}
                  </select>
                </fieldset>
                <div class="invalid-feedback">can't be blank</div>
              </div>
            </div>
          </form>
        HTML

        actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
          concat(form.date_select(:interview_date))
        end

        expect(actual).to match_html(expected)
      end
    end
  end
end
