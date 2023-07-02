# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/check_box_spec.rb

RSpec.describe RailsBootstrapForm::Inputs::CheckBox do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#check_box" do
    it "disables wrapper" do
      expected = <<~HTML
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
          <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
        </div>
      HTML

      actual = form_builder.check_box :remember_me, bootstrap: {wrapper: false}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:terms, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" class="new_user" id="new_user" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <div class="form-check">
              <input class="form-check-input is-invalid" type="checkbox" value="1" name="user[terms]" id="user_terms" />
              <label class="form-check-label is-invalid" for="user_terms">I accept terms and conditions</label>
              <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_for(user, url: "/test") do |form|
        concat(form.check_box(:terms))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:terms, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" class="new_user row row-cols-lg-auto g-3 align-items-center" id="new_user" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input is-invalid" type="checkbox" value="1" name="user[terms]" id="user_terms" />
              <label class="form-check-label is-invalid" for="user_terms">I accept terms and conditions</label>
              <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_for(user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.check_box(:terms))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:terms, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" class="new_user" id="new_user" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <div class="col-sm-10 offset-sm-2">
              <div class="form-check">
                <input class="form-check-input is-invalid" type="checkbox" value="1" name="user[terms]" id="user_terms" />
                <label class="form-check-label is-invalid" for="user_terms">I accept terms and conditions</label>
                <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
                <div class="invalid-feedback">can't be blank</div>
              </div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_for(user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
        concat(form.check_box(:terms))
      end

      expect(actual).to match_html(expected)
    end
  end
end
