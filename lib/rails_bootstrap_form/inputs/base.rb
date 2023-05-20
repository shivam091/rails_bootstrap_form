# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module Base
      extend ActiveSupport::Concern

      def self.included(base_class)
        def collection_input_checked?(checked, obj, input_value)
          checked == input_value || Array(checked).try(:include?, input_value) ||
            checked == obj || Array(checked).try(:include?, obj)
        end

        private :collection_input_checked?
      end
    end
  end
end
