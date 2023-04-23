class AddForeignKeysToTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :carries, :suppliers

    add_foreign_key :advertises, :users
    add_foreign_key :advertises, :adverts

    add_foreign_key :rates, :users
    add_foreign_key :rates, :adverts

    add_foreign_key :orders, :users
    add_foreign_key :orders, :adverts
    add_foreign_key :orders, :suppliers

    add_foreign_key :delivers, :orders
    add_foreign_key :delivers, :suppliers
  end
end
