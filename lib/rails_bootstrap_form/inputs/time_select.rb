# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module TimeSelect
      extend ActiveSupport::Concern

      included do
        bootstrap_select_group :time_select
      end
    end
  end
end
