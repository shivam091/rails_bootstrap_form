# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module StaticField
      extend ActiveSupport::Concern

      included do
        def static_field(attribute, options = {})
          options.tap do |option|
            option[:readonly] = true
            option[:disabled] = true
            option[:bootstrap] = {
              floating: false,
              field_class: bootstrap_form_options.static_field_class
            }.reverse_merge!(options.fetch(:bootstrap, {}))
          end

          options[:value] = object.send(attribute) unless options.key?(:value)

          text_field(attribute, options)
        end
      end
    end
  end
end
