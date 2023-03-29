class CreateFelhasznalos < ActiveRecord::Migration[7.0]
  def change
    create_table :felhasznalos do |t|
      t.string :nev
      t.string :email
      t.string :jelszo

      t.timestamps
    end
  end
end
