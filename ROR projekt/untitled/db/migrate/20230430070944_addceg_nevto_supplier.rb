class AddcegNevtoSupplier < ActiveRecord::Migration[7.0]
  def change
    change_table :suppliers do |t|
      t.string :ceg_nev, default: false
    end
  end
end
