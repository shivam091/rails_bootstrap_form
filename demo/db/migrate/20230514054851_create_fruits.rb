# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class CreateFruits < ActiveRecord::Migration[7.0]
  def change
    create_table :fruits do |t|
      t.string :name
      t.timestamps
    end
  end
end
