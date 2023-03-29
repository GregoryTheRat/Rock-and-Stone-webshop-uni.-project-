class CreateMitszallits < ActiveRecord::Migration[7.0]
  def change
    create_table :mitszallits do |t|
      t.integer :szallito_id
      t.string :mit
      t.float :mennyiseg
      t.float :ar_kg
      t.integer :min_vasarlas

      t.timestamps
    end
  end
end
