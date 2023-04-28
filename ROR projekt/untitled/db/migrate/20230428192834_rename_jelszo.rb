class RenameJelszo < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.rename :password, :password_digest
    end
  end
end
