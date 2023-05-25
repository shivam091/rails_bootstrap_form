# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module RichTextArea
      extend ActiveSupport::Concern

      included do
        def rich_text_area(attribute, options = {})
          options[:class] = ["trix-content", options[:class]].compact.join(" ")

          field_wrapper_builder(attribute, options) do
            super(attribute, options)
          end
        end
      end
    end
  end
end
