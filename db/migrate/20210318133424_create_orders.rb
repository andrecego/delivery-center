class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.citext :external_code, null: false, index: { unique: true }
      t.integer :store_id
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :shipping_cost, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.belongs_to :customer, null: false, foreign_key: true
      t.datetime :date_created

      t.timestamps
    end
  end
end
