# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  class Configuration
    # Default HTML attributes which will applied to all forms build
    # using RailsBootstrapForm.
    def default_form_attributes=(attributes)
      case attributes
      when nil
        @default_form_attributes = {}
      when Hash
        @default_form_attributes = attributes
      else
        raise ArgumentError, "Unsupported default_form_attributes #{attributes.inspect}"
      end
    end

    def default_form_attributes
      return @default_form_attributes if defined?(@default_form_attributes)

      {}
    end
  end
end
