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

    # conn = OCI8.new('localuser', 'asd', '//localhost:1521/XE')

    #cursor = conn.parse('SELECT get_user_koltsegek(:user_id) FROM DUAL')
    allcost=ActiveRecord::Base.connection.exec_query("SELECT get_user_koltsegek(#{session[:user_id]})as koltseg FROM DUAL"


    )
    @cost=allcost
    # ActiveRecord::Base.connection.exec_query("Seelc").to_a


  end
end