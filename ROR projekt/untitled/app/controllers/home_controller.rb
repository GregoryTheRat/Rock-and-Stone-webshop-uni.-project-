class HomeController < ApplicationController
  def home
    @adverts = Advert.all
  end
end
