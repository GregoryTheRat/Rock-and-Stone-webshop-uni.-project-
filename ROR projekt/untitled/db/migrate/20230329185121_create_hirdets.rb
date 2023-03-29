class CreateHirdets < ActiveRecord::Migration[7.0]
  def change
    create_table :hirdets do |t|
      t.integer :felhaszn_id
      t.integer :hirdetes_id
      t.date :mikor

      t.timestamps
    end
  end
end
