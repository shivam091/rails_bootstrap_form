# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module MonthField
      extend ActiveSupport::Concern

      included do
        bootstrap_field :month_field
      end
    end
  end
end
