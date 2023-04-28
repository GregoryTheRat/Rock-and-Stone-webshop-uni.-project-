class CreateAdverts < ActiveRecord::Migration[7.0]
  def change
    create_table :adverts do |t|
      t.string :termek_nev
      t.float :mennyiseg
      t.float :ar_kg
      t.integer :min_vasarlas
      t.string :leiras
      t.timestamps
    end
  end
end
