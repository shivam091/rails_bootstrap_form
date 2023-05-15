# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class Address < ApplicationRecord
  belongs_to :user
  belongs_to :country

  delegate :name, to: :country, prefix: true
end
