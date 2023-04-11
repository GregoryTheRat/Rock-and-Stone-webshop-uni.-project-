class ChangeDeliveriesToCarries < ActiveRecord::Migration[7.0]
  def change
    rename_table :deliveries, :carries
  end
end
