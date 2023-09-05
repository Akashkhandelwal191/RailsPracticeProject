class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :integer
    add_column :users, :mobile_number, :integer
    add_column :users, :username, :string
  end
end
