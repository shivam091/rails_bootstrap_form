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
  end
end
