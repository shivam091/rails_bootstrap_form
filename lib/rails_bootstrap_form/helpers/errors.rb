# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Errors
      extend ActiveSupport::Concern

      private

      def is_invalid?(attribute)
        (attribute && object.respond_to?(:errors) && has_attribute_error?(attribute)) ||
          has_association_error?(attribute)
      end

      def generate_error(attribute)
        if is_invalid?(attribute)
          error_text = error_messages(attribute)
          error_klass = "invalid-feedback"

          tag.div(error_text, class: error_klass)
        end
      end

      def error_messages(attribute)
        messages = Array(attribute_error_messages(attribute))
        messages << associated_error_messages(attribute)

        messages.flatten.to_sentence
      end

      def has_attribute_error?(attribute)
        attribute_error_messages(attribute).any?
      end

      def has_association_error?(attribute)
        object.class.try(:reflections)&.any? do |association_name, association|
          has_errors_on_association?(attribute, association_name)
        end
      end

      def has_errors_on_association?(attribute, association_name)
        return false unless is_belongs_to_association?(object.class.reflections[association_name])
        return false unless is_association_same?(attribute, object.class.reflections[association_name])

        object.errors[association_name].any?
      end

      def attribute_error_messages(attribute)
        object.errors[attribute]
      end

      def associated_error_messages(attribute)
        error_messages = []

        object.class.try(:reflections)&.each do |association_name, association|
          next unless is_belongs_to_association?(association)
          next unless is_association_same?(attribute, association)

          error_messages << object.errors[association_name]
        end

        error_messages
      end

      def is_belongs_to_association?(association)
        association.is_a?(ActiveRecord::Reflection::BelongsToReflection)
      end

      def is_association_same?(attribute, association)
        (association.foreign_key == attribute.to_s)
      end
    end
  end
end
