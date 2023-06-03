# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Labels
      extend ActiveSupport::Concern

      def self.included(base_class)
        def draw_label(attribute, options, bootstrap)
          unless bootstrap.skip_label? && !bootstrap.floating?
            label_options = {
              class: label_classes(attribute, options, bootstrap)
            }
            label_options[:for] = options[:id] if options[:id].present?
            label_text = label_text(attribute, bootstrap)

            label(attribute, label_text, label_options)
          end
        end

        def label_classes(attribute, options, bootstrap)
          classes = []
          classes << label_layout_classes(bootstrap)
          classes << bootstrap.additional_label_class
          classes << bootstrap.hide_class if hide_class_required?(bootstrap)
          classes << "required" if is_field_required?(attribute, options)
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def label_layout_classes(bootstrap)
          if bootstrap.layout_horizontal?
            [bootstrap.label_col_class, bootstrap.label_col_wrapper_class]
          else
            bootstrap.label_class
          end
        end

        def label_text(attribute, bootstrap)
          bootstrap.label_text || object&.class.try(:human_attribute_name, attribute)
        end

        def hide_class_required?(bootstrap)
          bootstrap.hide_label? || (bootstrap.layout_inline? && !bootstrap.floating?)
        end

        private :draw_label, :label_classes, :label_text, :label_layout_classes,
                :hide_class_required?
      end
    end
  end
end
