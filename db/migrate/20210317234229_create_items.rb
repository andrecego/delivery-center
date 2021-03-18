class CreateItems < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'citext'

    create_table :items do |t|
      t.citext :external_code, null: false, index: { unique: true }
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
