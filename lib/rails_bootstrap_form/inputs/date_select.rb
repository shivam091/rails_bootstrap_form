# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module DateSelect
      extend ActiveSupport::Concern

      included do
        bootstrap_select_group :date_select
      end
    end
  end
end
