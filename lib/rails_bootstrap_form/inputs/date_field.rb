# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module DateField
      extend ActiveSupport::Concern

      included do
        bootstrap_field :date_field
      end
    end
  end
end
