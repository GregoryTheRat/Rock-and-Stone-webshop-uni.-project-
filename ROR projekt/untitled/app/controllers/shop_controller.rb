class ShopController < ApplicationController
  def show
    id = params[:id]
    query_result = ActiveRecord::Base.connection.exec_query("
        SELECT advertises.*, users.nev, adverts.*
        FROM advertises
        JOIN users ON advertises.user_id = users.id
        JOIN adverts ON advertises.advert_id = adverts.id
        WHERE adverts.id = #{id}")
    query_result.to_a
    @advert_with_user = query_result
    termek = @advert_with_user[0]['termek_nev'].to_s
    termek = termek.upcase

    rates_query = ActiveRecord::Base.connection.exec_query("
        SELECT AVG(csillag) AS avg
        FROM rates
        WHERE advert_id  =#{id}")
    rates_query.to_a
    @rates = rates_query

    #suppliers_query = ActiveRecord::Base.connection.exec_query("")

    carries = ActiveRecord::Base.connection.exec_query("SELECT supplier_id ,mit FROM carries")

    suppliers_a = Array.new
    carries.each do |c|
      if termek.match(c['mit'])
        suppliers_query = ActiveRecord::Base.connection.exec_query("SELECT * FROM suppliers WHERE
                            id = #{c['supplier_id']}")
        suppliers_a.push(suppliers_query)
      end
    end
    @suppliers = suppliers_a

  end
end
