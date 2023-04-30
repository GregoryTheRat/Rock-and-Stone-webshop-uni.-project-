class TriggerDeleteAdvert < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
    CREATE OR REPLACE TRIGGER delete_advert
    BEFORE DELETE ON adverts
    FOR EACH ROW
    BEGIN
      DELETE FROM advertises WHERE advert_id = :OLD.id;
      DELETE FROM orders WHERE advert_id = :OLD.id;
      DELETE FROM rates WHERE advert_id = :OLD.id;
    END;
    SQL
  end
end
