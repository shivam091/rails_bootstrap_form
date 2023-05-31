# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module StaticField
      extend ActiveSupport::Concern

      included do
        def static_field(*args)
          options = args.extract_options!
          attribute = args.first

          static_options = options.merge(
            readonly: true,
            disabled: true,
            bootstrap: {
              field_class: bootstrap_form_options.static_field_class
            }
          )

          static_options[:value] = object.send(attribute) unless options.key?(:value)

          text_field(attribute, static_options)
        end
      end
    end
  end
end
