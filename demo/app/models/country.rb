# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class Country < ApplicationRecord
  DEFAULT_OPTIONS = [
    "India",
    "Ireland",
    "United States",
    "United Kingdom",
    "Spain",
    "France",
    "Canada"
  ].freeze

  has_many :addresses, dependent: :restrict_with_exception
  has_many :cities, dependent: :destroy
end
