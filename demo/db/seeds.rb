# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

::Country::DEFAULT_OPTIONS.each do |country|
  ::Country.find_or_create_by(name: country)
end

::Fruit::DEFAULT_OPTIONS.each do |fruit|
  ::Fruit.find_or_create_by(name: fruit)
end

::Skill::DEFAULT_OPTIONS.each do |skill|
  ::Skill.find_or_create_by(name: skill)
end
