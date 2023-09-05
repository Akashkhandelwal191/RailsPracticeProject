class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :city
      t.string :country
      t.string :state
      t.string :area
      t.integer :postal_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
