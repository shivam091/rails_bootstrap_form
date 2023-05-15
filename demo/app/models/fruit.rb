# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class Fruit < ApplicationRecord
  DEFAULT_OPTIONS = [
    "Mango",
    "Apple",
    "Orange",
    "Watermelon"
  ].freeze

  has_many :users, dependent: :restrict_with_exception
end
