class AddColumnsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :razorpay_order_id, :string
  end
end
