class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.integer :supplier_id
      t.string :mit
      t.float :mennyiseg
      t.float :ar_kg
      t.float :min_vasarlas


      t.timestamps
    end
    add_foreign_key :deliveries, :suppliers, column: :supplier_id
  end
end
