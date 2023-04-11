class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nev
      t.string :email
      t.string :jelszo

      t.timestamps
    end
  end
end
