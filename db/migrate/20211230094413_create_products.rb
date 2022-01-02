# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,         default: ''
      t.text :description, default: ''
      t.string :color, default: ''
      t.string :size_available, default: ''
      t.decimal :price, default: 0.0
      t.boolean :available, default: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
