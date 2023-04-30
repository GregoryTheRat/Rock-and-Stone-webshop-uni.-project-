class TriggerDeleteSuppliers < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE OR REPLACE TRIGGER delete_sup
      BEFORE DELETE ON suppliers
      FOR EACH ROW
      BEGIN
          DELETE FROM delivers WHERE supplier_id = :OLD.id;
          DELETE FROM orders WHERE supplier_id = :OLD.id;
          DELETE FROM carries WHERE supplier_id = :OLD.id;
      END;
    SQL
  end
end
