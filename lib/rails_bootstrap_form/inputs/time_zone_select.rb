# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module TimeZoneSelect
      extend ActiveSupport::Concern

      included do
        def time_zone_select(attribute, priority_zones = nil, options = {}, html_options = {})
          options = {bootstrap: {field_class: "form-select"}}.deep_merge!(options)

          field_wrapper_builder(attribute, options, html_options) do
            super(attribute, priority_zones, options, html_options)
          end
        end
      end
    end
  end
end
