# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class User < ApplicationRecord
  validates :name, presence: true, length: {in: 2..50}
  validates :email, presence: true

  has_one :address, dependent: :destroy

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills, source: :skill

  belongs_to :fruit

  delegate :name, to: :fruit, prefix: true

  accepts_nested_attributes_for :address, update_only: true

  def address
    super.presence || build_address
  end
end
