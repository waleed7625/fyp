class AddProductsToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :product, foreign_key: true
  end
end
