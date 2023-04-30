class ShopController < ApplicationController
  def show
    @advert = Advert.find(params[:id])
    @carries = ActiveRecord::Base.connection.exec_query("SELECT * FROM carries WHERE mit LIKE #{@advert.termek_nev}").to_a


  end
end
