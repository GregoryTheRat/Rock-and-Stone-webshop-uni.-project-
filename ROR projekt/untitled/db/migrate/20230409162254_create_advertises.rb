class CreateAdvertises < ActiveRecord::Migration[7.0]
  def change
    create_table :advertises do |t|
      t.integer :user_id
      t.integer :advert_id
      t.date :mikor

      t.timestamps
    end
    add_foreign_key :advertises, :users
    add_foreign_key :advertises, :adverts
  end
end
