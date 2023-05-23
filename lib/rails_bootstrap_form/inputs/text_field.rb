# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module TextField
      extend ActiveSupport::Concern

      included do
        bootstrap_field :text_field
      end
    end
  end
end
