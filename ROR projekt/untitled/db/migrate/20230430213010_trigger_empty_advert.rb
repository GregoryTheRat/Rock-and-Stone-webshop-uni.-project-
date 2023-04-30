class TriggerEmptyAdvert < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE OR REPLACE TRIGGER delete_row_on_null_update 
        AFTER UPDATE ON adverts 
        FOR EACH ROW 
        BEGIN 
        IF :NEW.mennyiseg IS NULL THEN DELETE 
          FROM adverts WHERE id = :OLD.id; 
        END IF; 
    END;
    SQL
  end
end
