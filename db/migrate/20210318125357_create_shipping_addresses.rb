class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :postal_code
      t.string :number
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
