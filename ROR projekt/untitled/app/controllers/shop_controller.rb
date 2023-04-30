class ShopController < ApplicationController


  require 'date'

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



    ratesresult=ActiveRecord::Base.connection.exec_query("SELECT users.nev, rates.csillag,rates.leiras FROM rates,users Where rates.user_id=users.id AND rates.advert_id =#{id}")
    @ratings=ratesresult.to_a

    termek = @advert_with_user[0]['termek_nev'].to_s
    termek = termek.upcase

    rates_query = ActiveRecord::Base.connection.exec_query("
        SELECT AVG(csillag) AS avg
        FROM rates
        WHERE advert_id  =#{id}")
    rates_query.to_a
    @rates = rates_query

    # suppliers_query = ActiveRecord::Base.connection.exec_query("")

    carries = ActiveRecord::Base.connection.exec_query("SELECT supplier_id ,mit FROM carries")

    suppliers_a = Array.new
    carries.each do |c|
      if termek.match(c['mit'])
        suppliers_query = ActiveRecord::Base.connection.exec_query("SELECT * FROM suppliers WHERE
                            id = #{c['supplier_id']}")
        suppliers_a.push(suppliers_query)
      end
    end


    options = Array.new
    suppliers_a.each do |s|
      key = s[0]['ceg_nev'] + " " + s[0]['km_ar'].to_s + "Ft/km " + s[0]['ar_kg'].to_s + "Ft/kg"
      value = s[0]['id']
      options.push([key, value])
    end
    @options_hash = options.to_h



  end


  def buy
    params[:user_id] = session[:user_id]

    #error handling
    selected_advert = Advert.find_by(id: params['advert_id'])
    if selected_advert.mennyiseg < params['mennyiseg'].to_f
      flash[:notice] = "Nincs ennyi termék!"
      redirect_to shop_path(selected_advert.id)
    elsif selected_advert.min_vasarlas > params['mennyiseg'].to_f
      flash[:notice] = "Minimum " + selected_advert.min_vasarlas.to_s + " kg-ot kell venned!"
      redirect_to shop_path(selected_advert.id)
    else
      # advert frissítése
      new_mennyiseg = selected_advert.mennyiseg - params[:mennyiseg].to_f
      Advert.update(id = selected_advert.id, mennyiseg: new_mennyiseg)


      #supplier lekérése számolás miatt
      selected_supplier = Supplier.find_by(id: params[:supplier_id])
      km_ar = selected_supplier.km_ar
      ar_kg = selected_supplier.ar_kg
      koltseg = params['mennyiseg'].to_f * ar_kg + km_ar * 100
      date = Date.today.next_week

      # rendelés lértehozása
      current_order =  Order.create(user_id: params['user_id'], advert_id: params['advert_id'], supplier_id: params['supplier_id']);


      # kiszállítás(delivers) létrehozása
      Deliver.create(order_id: current_order.id, supplier_id: selected_supplier.id, mennyiseg: params['mennyiseg'], hova: params['hova'],
                   koltseg: koltseg, varhato_szallitas: date)

      redirect_to bag_path
    end
  end

  def order_params
    params.require(:order).permit(:user_id, :advert_id, :supplier_id)
  end
end
