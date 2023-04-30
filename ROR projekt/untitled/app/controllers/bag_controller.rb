class BagController < ApplicationController
  def bag
    result =ActiveRecord::Base.connection.exec_query("SELECT adverts.termek_nev,suppliers.ceg_nev,delivers.mennyiseg,delivers.koltseg,delivers.hova From
orders,adverts,suppliers,delivers,users
WHERE delivers.order_id=orders.id
AND delivers.supplier_id=suppliers.id
AND orders.user_id=users.id
AND orders.advert_id= adverts.id
AND orders.supplier_id=suppliers.id
AND users.id=#{session[:user_id]}")
    @allorders=result.to_a
    # ActiveRecord::Base.connection.exec_query("Seelc").to_a


  end
end