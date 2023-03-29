class CreateErtekels < ActiveRecord::Migration[7.0]
  def change
    create_table :ertekels do |t|
      t.integer :felhaszn_id
      t.integer :hirdetes_id
      t.integer :csillag
      t.string :leiras

      t.timestamps
    end
  end
end
