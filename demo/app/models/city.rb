# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class City < ApplicationRecord
  DEFAULT_OPTIONS = {
    "India" => ["Mumbai", "New Delhi", "Kolkata", "Chennai"],
    "Ireland" => ["Dublin", "Galway", "Cork", "Belfast"],
    "United States" => ["New York", "Los Angeles", "San Francisco", "Chicago"],
    "United Kingdom" => ["London", "Edinburgh", "Manchester", "Bristol"],
    "Spain" => ["Barcelona", "Madrid", "Seville", "Granada"],
    "France" => ["Paris", "Nice", "Lyon", "Marseille"],
    "Canada" => ["Toronto", "Montreal", "Vancouver", "Calgary"],
  }.freeze

  belongs_to :country
end
