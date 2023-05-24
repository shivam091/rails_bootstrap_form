# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Labels
      extend ActiveSupport::Concern

      def self.included(base_class)
        def draw_label(attribute, options, bootstrap_options)
          unless bootstrap_options.skip_label? && !bootstrap_options.floating?
            label_options = {
              class: label_classes(attribute, bootstrap_options)
            }
            label_options[:for] = options[:id] if options[:id].present?
            label_text = label_text(attribute, bootstrap_options)

            label(attribute, label_text, label_options)
          end
        end

        def label_classes(attribute, bootstrap_options)
          classes = []
          classes << if bootstrap_options.layout_horizontal?
            [bootstrap_options.label_col_class, bootstrap_options.label_col_wrapper_class]
          else
            bootstrap_options.label_class
          end
          classes << bootstrap_options.additional_label_class
          classes << bootstrap_options.hide_class if bootstrap_options.hide_label?
          classes << "required" if is_attribute_required?(attribute)
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def label_text(attribute, bootstrap_options)
          bootstrap_options.label_text || object&.class.try(:human_attribute_name, attribute)
        end

        private :draw_label, :label_classes, :label_text
      end
    end
  end
end
