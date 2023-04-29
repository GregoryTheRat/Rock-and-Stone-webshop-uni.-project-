class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.boolean :admin, default: false
    end
  end
end
