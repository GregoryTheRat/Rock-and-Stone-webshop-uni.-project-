class CreateKiszallits < ActiveRecord::Migration[7.0]
  def change
    create_table :kiszallits do |t|
      t.integer :rendel_id
      t.integer :szallito_id
      t.float :mennyiseg
      t.string :hova
      t.float :koltseg
      t.date :varhato_szallitas

      t.timestamps
    end
  end
end
