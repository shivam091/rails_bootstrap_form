# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/date_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::DateField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#date_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="date" name="user[interview_date]" id="user_interview_date" />
      HTML

      actual = form_builder.date_field :interview_date, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_interview_date">Interview date</label>
          <input class="form-control" type="date" name="user[interview_date]" id="user_interview_date" />
        </div>
      HTML

      actual = form_builder.date_field :interview_date

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_interview_date">Interview date</label>
          <input class="form-control" placeholder="Interview date" type="date" name="user[interview_date]" id="user_interview_date" />
        </div>
      HTML

      actual = form_builder.date_field :interview_date, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_interview_date">Interview date</label>
          <div class="col-sm-10">
            <input class="form-control" type="date" name="user[interview_date]" id="user_interview_date" />
          </div>
        </div>
      HTML

      actual = form_builder.date_field :interview_date, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:interview_date, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label is-invalid" for="user_interview_date">Interview date</label>
            <input class="form-control is-invalid" type="date" name="user[interview_date]" id="user_interview_date" />
            <div class="invalid-feedback">can't be blank</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.date_field(:interview_date))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:interview_date, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <label class="form-label visually-hidden is-invalid" for="user_interview_date">Interview date</label>
            <input class="form-control is-invalid" placeholder="Interview date" type="date" name="user[interview_date]" id="user_interview_date" />
            <div class="invalid-feedback">can't be blank</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.date_field(:interview_date))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:interview_date, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <label class="col-form-label col-sm-2 is-invalid" for="user_interview_date">Interview date</label>
            <div class="col-sm-10">
              <input class="form-control is-invalid" type="date" name="user[interview_date]" id="user_interview_date" />
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
        concat(form.date_field(:interview_date))
      end

      expect(actual).to match_html(expected)
    end
  end
end
