# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module DatetimeSelect
      extend ActiveSupport::Concern

      included do
        bootstrap_select_group :datetime_select
      end
    end
  end
end
