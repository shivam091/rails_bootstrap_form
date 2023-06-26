# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class AdminUser
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, :password, presence: true
end
