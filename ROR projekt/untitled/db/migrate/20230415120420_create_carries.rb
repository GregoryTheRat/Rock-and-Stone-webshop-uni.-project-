class CreateCarries < ActiveRecord::Migration[7.0]
  def change
    create_table :carries do |t|
      t.integer :supplier_id
      t.string :mit

      t.timestamps
    end
  end
end
