# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    module RequiredField
      extend ActiveSupport::Concern

      def self.included(base_class)
        def is_field_required?(attribute, options)
          return false unless attribute

          if options.key?(:required)
            options[:required]
          else
            is_attribute_required?(attribute)
          end
        end

        def required_field_options(attribute, options)
          required = is_field_required?(attribute, options)

          {}.tap do |option|
            option[:aria] = {required: true} if required
            option[:required] = required
          end
        end

        def is_attribute_required?(attribute)
          return false unless attribute

          target = object.instance_of?(Class) ? object : object.class
          return false unless target.respond_to?(:validators_on)

          has_presence_validator?(target_validators(target, attribute)) ||
            is_required_association?(target, attribute)
        end

        def target_validators(target, attribute)
          target.validators_on(attribute).map(&:class)
        end

        def has_presence_validator?(target_validators)
          target_validators.include?(ActiveModel::Validations::PresenceValidator) ||
            (defined?(ActiveRecord::Validations::PresenceValidator) &&
              target_validators.include?(ActiveRecord::Validations::PresenceValidator))
        end

        def is_required_association?(target, attribute)
          target.reflections.find do |name, a|
            next unless a.is_a?(ActiveRecord::Reflection::BelongsToReflection)
            next unless a.foreign_key == attribute.to_s

            has_presence_validator?(target_validators(target, name))
          end
        end

        private :is_field_required?, :required_field_options, :target_validators,
                :has_presence_validator?, :is_required_association?
      end
    end
  end
end
