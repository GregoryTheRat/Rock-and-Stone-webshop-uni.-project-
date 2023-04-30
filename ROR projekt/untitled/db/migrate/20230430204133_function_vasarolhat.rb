class FunctionVasarolhat < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
    CREATE OR REPLACE FUNCTION LEHETEVASAROLNI(vasarlas IN NUMBER,ad_id number) RETURN BOOLEAN
      IS
      ossz NUMBER;
      vasarolhat BOOLEAN;
      BEGIN
      SELECT mennyiseg INTO ossz FROM adverts
      where adverts.id=ad_id;
  
      IF ossz <= vasarlas THEN
      vasarolhat := FALSE;
      ELSE
      vasarolhat := TRUE;
      END IF;
  
      RETURN vasarolhat;
    END;
    SQL
  end
end
