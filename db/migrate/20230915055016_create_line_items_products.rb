class CreateLineItemsProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items_products do |t|
      t.integer :quantity
      t.float :total_price
      t.references :purchasable, polymorphic: true, null: false
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
