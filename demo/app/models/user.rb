# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class User < ApplicationRecord

  attr_accessor :username, :remember_me, :appointment_date, :appointment_time, :appointment_datetime, :weekly_off, :gender

  validates :name, presence: true, length: {in: 2..50}
  validates :terms, acceptance: true
  validates :email,
            :password,
            :mobile_number,
            :birth_date,
            :favorite_color,
            :fruit_id,
            :skill_ids,
            presence: true

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
