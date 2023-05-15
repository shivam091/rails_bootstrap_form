# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: false do |t|
      t.references :user, primary_key: true
      t.references :country
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.timestamps
    end
  end
end
