class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string  :product_name
      t.text  :product_description
      t.float :product_price,precision: 10, scale: 2
      t.integer :product_quantity
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
