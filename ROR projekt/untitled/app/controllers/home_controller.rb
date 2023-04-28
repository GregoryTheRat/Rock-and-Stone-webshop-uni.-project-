class HomeController < ApplicationController
  def home
    @adverts = Advert.all
  end

  def destroy
    session.clear
    redirect_to home_path
  end

end
