class AddIndexToProductWishList < ActiveRecord::Migration[7.0]
  def change
    add_index :products_wish_lists, [ :product_id, :wish_list_id ], :unique => true, :name => 'by_product_and_wish_list'
  end
end
