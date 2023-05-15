# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    module Labels
      extend ActiveSupport::Concern

      def self.included(base_class)
        def label(attribute, bootstrap_options)
          unless bootstrap_options.skip_label
            label_class = label_classes(attribute, bootstrap_options)
            label_text = label_text(attribute, bootstrap_options)

            super(attribute, label_text, class: label_class)
          end
        end

        def label_classes(attribute, bootstrap_options)
          classes = [bootstrap_options.label_class, bootstrap_options.additional_label_class]
          classes << bootstrap_options.hide_class if bootstrap_options.hide_label
          classes << "required" if is_attribute_required?(attribute)
          classes.flatten.compact
        end

        def label_text(attribute, bootstrap_options)
          bootstrap_options.label_text || object&.class.try(:human_attribute_name, attribute)
        end

        private :label, :label_classes, :label_text
      end
    end
  end
end
