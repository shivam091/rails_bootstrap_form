# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/collection_radio_buttons_spec.rb

RSpec.describe RailsBootstrapForm::Inputs::CollectionRadioButtons do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#collection_radio_buttons" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="hidden" name="user[fruit_id]" value="" #{autocomplete_attr} />
        <input type="radio" value="1" name="user[fruit_id]" id="user_fruit_id_1" />
        <label for="user_fruit_id_1">Mango</label>
        <input type="radio" value="2" name="user[fruit_id]" id="user_fruit_id_2" />
        <label for="user_fruit_id_2">Apple</label>
        <input type="radio" value="3" name="user[fruit_id]" id="user_fruit_id_3" />
        <label for="user_fruit_id_3">Orange</label>
        <input type="radio" value="4" name="user[fruit_id]" id="user_fruit_id_4" />
        <label for="user_fruit_id_4">Watermelon</label>
      HTML

      actual = form_builder.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
          <div class="rails-bootstrap-forms-collection-radio-buttons">
            <div class="form-check">
              <input id="user_fruit_id_1" class="form-check-input" type="radio" value="1" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_1">Mango</label>
            </div>
            <div class="form-check">
              <input id="user_fruit_id_2" class="form-check-input" type="radio" value="2" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_2">Apple</label>
            </div>
            <div class="form-check">
              <input id="user_fruit_id_3" class="form-check-input" type="radio" value="3" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_3">Orange</label>
            </div>
            <div class="form-check">
              <input id="user_fruit_id_4" class="form-check-input" type="radio" value="4" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_fruit_id">Favorite fruit</label>
          <div class="rails-bootstrap-forms-collection-radio-buttons">
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_1" class="form-check-input" type="radio" value="1" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_1">Mango</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_2" class="form-check-input" type="radio" value="2" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_2">Apple</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_3" class="form-check-input" type="radio" value="3" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_3">Orange</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_4" class="form-check-input" type="radio" value="4" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_fruit_id">Favorite fruit</label>
          <div class="col-sm-10">
            <div class="rails-bootstrap-forms-collection-radio-buttons">
              <div class="form-check">
                <input id="user_fruit_id_1" class="form-check-input" type="radio" value="1" name="user[fruit_id]" />
                <label class="form-check-label" for="user_fruit_id_1">Mango</label>
              </div>
              <div class="form-check">
                <input id="user_fruit_id_2" class="form-check-input" type="radio" value="2" name="user[fruit_id]" />
                <label class="form-check-label" for="user_fruit_id_2">Apple</label>
              </div>
              <div class="form-check">
                <input id="user_fruit_id_3" class="form-check-input" type="radio" value="3" name="user[fruit_id]" />
                <label class="form-check-label" for="user_fruit_id_3">Orange</label>
              </div>
              <div class="form-check">
                <input id="user_fruit_id_4" class="form-check-input" type="radio" value="4" name="user[fruit_id]" />
                <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
              </div>
            </div>
            <div class="form-text text-muted">Select your favorite fruit</div>
          </div>
        </div>
      HTML

      actual = form_builder.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "sets checked options" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
          <div class="rails-bootstrap-forms-collection-radio-buttons">
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_1" class="form-check-input" checked="checked" type="radio" value="1" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_1">Mango</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_2" class="form-check-input" type="radio" value="2" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_2">Apple</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_3" class="form-check-input" type="radio" value="3" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_3">Orange</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_4" class="form-check-input" type="radio" value="4" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, {checked: ::Fruit.first.id, bootstrap: {inline: true}}

      expect(actual).to match_html(expected)
    end

    it "renders inline radio buttons" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
          <div class="rails-bootstrap-forms-collection-radio-buttons">
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_1" class="form-check-input" type="radio" value="1" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_1">Mango</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_2" class="form-check-input" type="radio" value="2" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_2">Apple</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_3" class="form-check-input" type="radio" value="3" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_3">Orange</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_fruit_id_4" class="form-check-input" type="radio" value="4" name="user[fruit_id]" />
              <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, bootstrap: {inline: true}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:fruit_id, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label required is-invalid" for="user_fruit_id">Favorite fruit</label>
            <div class="rails-bootstrap-forms-collection-radio-buttons">
              <div class="form-check">
                <input id="user_fruit_id_1" class="form-check-input is-invalid" type="radio" value="1" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_1">Mango</label>
              </div>
              <div class="form-check">
                <input id="user_fruit_id_2" class="form-check-input is-invalid" type="radio" value="2" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_2">Apple</label>
              </div>
              <div class="form-check">
                <input id="user_fruit_id_3" class="form-check-input is-invalid" type="radio" value="3" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_3">Orange</label>
              </div>
              <div class="form-check">
                <input id="user_fruit_id_4" class="form-check-input is-invalid" type="radio" value="4" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_4">Watermelon</label>
              </div>
            </div>
            <div class="invalid-feedback">can't be blank</div>
            <div class="form-text text-muted">Select your favorite fruit</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.collection_radio_buttons(:fruit_id, ::Fruit.all, :id, :name))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:fruit_id, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <label class="form-label visually-hidden required is-invalid" for="user_fruit_id">Favorite fruit</label>
            <div class="rails-bootstrap-forms-collection-radio-buttons">
              <div class="form-check form-check-inline">
                <input id="user_fruit_id_1" class="form-check-input is-invalid" type="radio" value="1" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_1">Mango</label>
              </div>
              <div class="form-check form-check-inline">
                <input id="user_fruit_id_2" class="form-check-input is-invalid" type="radio" value="2" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_2">Apple</label>
              </div>
              <div class="form-check form-check-inline">
                <input id="user_fruit_id_3" class="form-check-input is-invalid" type="radio" value="3" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_3">Orange</label>
              </div>
              <div class="form-check form-check-inline">
                <input id="user_fruit_id_4" class="form-check-input is-invalid" type="radio" value="4" name="user[fruit_id]" />
                <label class="form-check-label is-invalid" for="user_fruit_id_4">Watermelon</label>
              </div>
            </div>
            <div class="invalid-feedback">can't be blank</div>
            <div class="form-text text-muted">Select your favorite fruit</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.collection_radio_buttons(:fruit_id, ::Fruit.all, :id, :name))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:fruit_id, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <label class="col-form-label col-sm-2 required is-invalid" for="user_fruit_id">Favorite fruit</label>
            <div class="col-sm-10">
              <div class="rails-bootstrap-forms-collection-radio-buttons">
                <div class="form-check">
                  <input id="user_fruit_id_1" class="form-check-input is-invalid" type="radio" value="1" name="user[fruit_id]" />
                  <label class="form-check-label is-invalid" for="user_fruit_id_1">Mango</label>
                </div>
                <div class="form-check">
                  <input id="user_fruit_id_2" class="form-check-input is-invalid" type="radio" value="2" name="user[fruit_id]" />
                  <label class="form-check-label is-invalid" for="user_fruit_id_2">Apple</label>
                </div>
                <div class="form-check">
                  <input id="user_fruit_id_3" class="form-check-input is-invalid" type="radio" value="3" name="user[fruit_id]" />
                  <label class="form-check-label is-invalid" for="user_fruit_id_3">Orange</label>
                </div>
                <div class="form-check">
                  <input id="user_fruit_id_4" class="form-check-input is-invalid" type="radio" value="4" name="user[fruit_id]" />
                  <label class="form-check-label is-invalid" for="user_fruit_id_4">Watermelon</label>
                </div>
              </div>
              <div class="invalid-feedback">can't be blank</div>
              <div class="form-text text-muted">Select your favorite fruit</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
        concat(form.collection_radio_buttons(:fruit_id, ::Fruit.all, :id, :name))
      end

      expect(actual).to match_html(expected)
    end
  end
end
