class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :offer, :integer,default:10
  end
end
