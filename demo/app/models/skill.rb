# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class Skill < ApplicationRecord
  DEFAULT_OPTIONS = [
    "Communication",
    "Problem Solving",
    "Leadership",
    "Writing",
    "Creativity",
    "Time Management",
    "Team Work",
    "Negotiation",
    "Decision Making",
    "Management"
  ].freeze

  has_many :user_skills, dependent: :restrict_with_exception
  has_many :users, through: :user_skills, source: :user
end
