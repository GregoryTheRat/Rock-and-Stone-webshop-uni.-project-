class TriggerDeleteUser2 < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
    CREATE OR REPLACE TRIGGER delete_user_2
    BEFORE DELETE ON orders
    FOR EACH ROW
    BEGIN
      DELETE FROM delivers WHERE order_id = :OLD.id;
    END;
    SQL
  end
end
