# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    extend ActiveSupport::Concern
    extend ActiveSupport::Autoload

    autoload :HelpText
    autoload :Labels
    autoload :RequiredField
    autoload :Errors
    autoload :Buttons
    autoload :Choice

    include HelpText
    include Labels
    include RequiredField
    include Errors
    include Buttons
    include Choice

    def self.included(base_class)
      def sanitized_tag_name(attribute, value)
        # label's `for` attribute needs to match checkbox/radio button tag's id, IE sanitized value, IE
        # https://github.com/rails/rails/blob/5-0-stable/actionview/lib/action_view/helpers/tags/base.rb#L123-L125
        "#{@object_name}_#{attribute}_#{value.to_s.gsub(/\s/, "_").gsub(/[^-[[:word:]]]/, "").mb_chars.downcase}"
      end

      def control_specific_class(field_tag_name)
        "rails-bootstrap-forms-#{field_tag_name.to_s.tr("_", "-")}"
      end

      def is_size_valid?(bootstrap)
        bootstrap.size && %i(sm lg).include?(bootstrap.size)
      end

      def field_offset_class(label_col_wrapper_class)
        label_col_wrapper_class.gsub(/\bcol-(\w+)-(\d)\b/, 'offset-\1-\2')
      end

      def add_css_class!(options, css_class)
        the_class = [options[:class], css_class].compact
        options[:class] = the_class if the_class.present?
      end

      # def remove_css_class!(options, css_class)
      #   the_class = options[:class].to_s.split(" ")
      #   options[:class] = (the_class - [css_class]).compact.join(" ")
      #   options.delete(:class) if options[:class].blank?
      # end

      private :control_specific_class, :is_size_valid?, :add_css_class!
    end
  end
end
