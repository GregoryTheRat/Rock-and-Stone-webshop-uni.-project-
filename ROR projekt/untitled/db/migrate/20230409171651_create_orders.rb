class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :advert_id
      t.integer :supplier_id

      t.timestamps
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :adverts
    add_foreign_key :orders, :suppliers
  end
end
