# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/rich_text_area_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::RichTextArea do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#rich_text_area" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="hidden" name="user[life_story]" id="user_life_story_trix_input_user" autocomplete="off" />
        <trix-editor
          id="user_life_story"
          input="user_life_story_trix_input_user"
          class="trix-content"
          data-direct-upload-url="#{data_direct_upload_url}"
          data-blob-url-template="#{data_blob_url_template}">
        </trix-editor>
      HTML

      actual = form_builder.rich_text_area :life_story, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_life_story">Life story</label>
          <input type="hidden" name="user[life_story]" id="user_life_story_trix_input_user" autocomplete="off" />
          <trix-editor
            class="trix-content form-control"
            id="user_life_story"
            input="user_life_story_trix_input_user"
            data-direct-upload-url="#{data_direct_upload_url}"
            data-blob-url-template="#{data_blob_url_template}">
          </trix-editor>
        </div>
      HTML

      actual = form_builder.rich_text_area :life_story

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_life_story">Life story</label>
          <div class="col-sm-10">
            <input type="hidden" name="user[life_story]" id="user_life_story_trix_input_user" autocomplete="off" />
            <trix-editor
              class="trix-content form-control"
              id="user_life_story"
              input="user_life_story_trix_input_user"
              data-direct-upload-url="#{data_direct_upload_url}"
              data-blob-url-template="#{data_blob_url_template}">
            </trix-editor>
          </div>
        </div>
      HTML

      actual = form_builder.rich_text_area :life_story, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
