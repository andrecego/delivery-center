class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.citext :external_code, null: false, index: { unique: true }
      t.string :name
      t.citext :email, null: false, index: { unique: true }
      t.string :contact

      t.timestamps
    end
  end
end
