# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module TextArea
      extend ActiveSupport::Concern

      included do
        bootstrap_field :text_area
      end
    end
  end
end
