class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :option, null: false
      t.decimal :value
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
