class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :advert_id
      t.integer :csillag
      t.text :leiras

      t.timestamps
    end
  end
end
