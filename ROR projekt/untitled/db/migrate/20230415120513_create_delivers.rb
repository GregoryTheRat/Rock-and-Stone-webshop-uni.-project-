class CreateDelivers < ActiveRecord::Migration[7.0]
  def change
    create_table :delivers do |t|
      t.integer :order_id
      t.integer :supplier_id
      t.float :mennyiseg
      t.string :hova
      t.float :koltseg
      t.date :varhato_szallitas

      t.timestamps
    end
  end
end
