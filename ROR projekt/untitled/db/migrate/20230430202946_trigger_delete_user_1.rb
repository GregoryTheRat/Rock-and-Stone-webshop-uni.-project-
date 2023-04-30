class TriggerDeleteUser1 < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE OR REPLACE TRIGGER delete_user_1
      BEFORE DELETE ON users
      FOR EACH ROW
      BEGIN
        DELETE FROM advertises WHERE user_id = :OLD.id;
        DELETE FROM rates WHERE user_id = :OLD.id;
        DELETE FROM orders WHERE user_id = :OLD.id;
      END;
    SQL
  end
end
