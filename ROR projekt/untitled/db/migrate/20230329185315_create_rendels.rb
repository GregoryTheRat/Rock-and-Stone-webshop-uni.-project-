class CreateRendels < ActiveRecord::Migration[7.0]
  def change
    create_table :rendels do |t|
      t.integer :felhaszn_id
      t.integer :hirdetes_id
      t.integer :szallito_id

      t.timestamps
    end
  end
end
