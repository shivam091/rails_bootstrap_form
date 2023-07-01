# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/special_form_class_models_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::BootstrapFormBuilder do
  context "when anonymous models are passed to form builder" do
    let(:user_klass) do
      Class.new(User) do
        def self.model_name
          ActiveModel::Name.new(User)
        end
      end
    end
    let(:user) { user_klass.new(email: "steve@example.com") }
    let(:form_builder) { described_class.new(:user, user, self, {}) }

    it "supports anonymous models" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" type="text" value="steve@example.com" name="user[email]" id="user_email" />
          <div class="form-text text-muted">Please use official email address</div>
        </div>
      HTML

      actual = form_builder.text_field :email

      expect(actual).to match_html(expected)
    end
  end

  context "when objects without model names are passed to form builder" do
    let(:super_user_klass) { ::SuperUser }
    let(:super_user) { super_user_klass.new(email: "steve@example.com") }
    let(:form_builder) { described_class.new(:super_user, super_user, self, {}) }

    it "supports objects without model names" do
      I18n.backend.store_translations(:en, activerecord: {
                                        help_texts: {
                                          super_user: {
                                            email: "Email must be unique"
                                          }
                                        }
                                      })

      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="super_user_email">Email</label>
          <input class="form-control" type="text" value="steve@example.com" name="super_user[email]" id="super_user_email" />
          <div class="form-text text-muted">Email must be unique</div>
        </div>
      HTML

      actual = form_builder.text_field :email

      expect(actual).to match_html(expected)
    end
  end

  context "when nil objects are passed to form builder" do
    let(:super_user) { nil }
    let(:form_builder) { described_class.new(:super_user, super_user, self, {}) }

    it "supports nil objects" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="super_user_email">Email</label>
          <input class="form-control" type="text" name="super_user[email]" id="super_user_email" />
        </div>
      HTML

      actual = form_builder.text_field :email

      expect(actual).to match_html(expected)
    end
  end

  context "when ActiveModel objects are passed to form builder" do
    let(:admin_user) { AdminUser.new(email: "steve@example.com") }
    let(:form_builder) { described_class.new(:admin_user, admin_user, self, {}) }

    it "supports ActiveModel objects" do
      expect(admin_user.valid?).to be_falsy

      I18n.backend.store_translations(:en, activerecord: {
                                        help_texts: {
                                          admin_user: {
                                            password: "A good password should be at least six characters long"
                                          }
                                        }
                                      })
      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label required is-invalid" for="admin_user_password">Password</label>
            <input class="form-control is-invalid" aria-required="true" required="required" type="text" name="admin_user[password]" id="admin_user_password" />
            <div class="invalid-feedback">can't be blank and </div>
            <div class="form-text text-muted">A good password should be at least six characters long</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: admin_user, url: "/test") do |form|
        concat(form.text_field(:password))
      end

      expect(actual).to match_html(expected)
    end
  end
end
