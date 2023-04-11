class RemoveDetailsFromCarries < ActiveRecord::Migration[7.0]
  def change
    remove_column :carries, :mennyiseg, :float
    remove_column :carries, :ar_kg, :float
    remove_column :carries, :min_vasarlas, :float
  end
end
