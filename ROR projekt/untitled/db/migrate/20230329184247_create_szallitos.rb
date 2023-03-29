class CreateSzallitos < ActiveRecord::Migration[7.0]
  def change
    create_table :szallitos do |t|
      t.float :km_ar
      t.float :ar_kg

      t.timestamps
    end
  end
end
