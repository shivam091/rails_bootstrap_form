# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    extend ActiveSupport::Concern

    def self.included(base_class)
      def collection_input_checked?(checked, obj, input_value)
        checked == input_value || Array(checked).try(:include?, input_value) ||
          checked == obj || Array(checked).try(:include?, obj)
      end

      def control_specific_class(field_tag_name)
        "rails-bootstrap-forms-#{field_tag_name.to_s.tr("_", "-")}"
      end

      def is_size_valid?(bootstrap_options)
        bootstrap_options.size && %i(sm lg).include?(bootstrap_options.size)
      end

      def field_offset_class(label_col_wrapper_class)
        label_col_wrapper_class.gsub(/\bcol-(\w+)-(\d)\b/, 'offset-\1-\2')
      end

      private :collection_input_checked?, :control_specific_class, :is_size_valid?
    end
  end
end
