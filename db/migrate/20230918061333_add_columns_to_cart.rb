class AddColumnsToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :total_price, :float
    add_column :carts, :total_amount, :float
  end
end
