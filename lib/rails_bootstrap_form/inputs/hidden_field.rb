# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module HiddenField
      extend ActiveSupport::Concern

      included do
        def hidden_field(attribute, options = {})
          options[:value] = object.send(attribute) unless options.key?(:value)

          super(attribute, options)
        end
      end
    end
  end
end
