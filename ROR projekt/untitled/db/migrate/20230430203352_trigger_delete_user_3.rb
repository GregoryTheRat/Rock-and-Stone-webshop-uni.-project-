class TriggerDeleteUser3 < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE OR REPLACE TRIGGER delete_user_3
      BEFORE DELETE ON advertises
      FOR EACH ROW
      BEGIN
        DELETE FROM adverts WHERE id = :OLD.advert_id;
      END;
    SQL
  end
end
