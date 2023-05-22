# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Errors
      extend ActiveSupport::Concern

      def self.included(base_class)
        def is_invalid?(attribute)
          (attribute && object.respond_to?(:errors) && object.errors[attribute].any?) ||
            has_association_error?(attribute)
        end

        def input_with_error(attribute, &block)
          input = capture(&block)
          input << generate_error(attribute)
          input
        end

        def generate_error(attribute)
          if is_invalid?(attribute)
            error_text = error_messages(attribute)
            error_klass = "invalid-feedback"

            tag.div(error_text, class: error_klass)
          end
        end

        def has_association_error?(attribute)
          object.class.reflections.any? do |association_name, association|
            next unless is_belongs_to_association?(association)
            next unless is_association_same?(attribute, association)

            object.errors[association_name].any?
          end
        end

        def error_messages(attribute)
          messages = object.errors[attribute]

          object.class.reflections.each do |association_name, association|
            next unless is_belongs_to_association?(association)
            next unless is_association_same?(attribute, association)

            messages << object.errors[association_name]
          end

          messages.flatten.to_sentence
        end

        def is_belongs_to_association?(association)
          association.is_a?(ActiveRecord::Reflection::BelongsToReflection)
        end

        def is_association_same?(attribute, association)
          (association.foreign_key == attribute.to_s)
        end

        private :is_invalid?, :input_with_error, :generate_error,
                :has_association_error?, :error_messages,
                :is_belongs_to_association?, :is_association_same?
      end
    end
  end
end
