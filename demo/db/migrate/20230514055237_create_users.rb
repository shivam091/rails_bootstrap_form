# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :mobile_number
      t.string :blog_url
      t.date :birth_date
      t.references :fruit
      t.boolean :terms
      t.string :excellence
      t.string :favorite_color
      t.timestamps
    end
  end
end
