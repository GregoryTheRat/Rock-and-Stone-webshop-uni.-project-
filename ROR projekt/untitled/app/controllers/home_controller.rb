class HomeController < ApplicationController
  def home
    @adverts = Advert.all
  end

  def search
    search_term = params['word'] # Get the search term from the form data
    query_result = ActiveRecord::Base.connection.exec_query("SELECT  *
FROM advertises,users,adverts
WHERE advertises.User_id=users.id
  AND advertises.advert_id=adverts.id
  AND termek_nev LIKE '%#{search_term}%'
")
    temp= query_result.to_a

    @results= temp
  end
  def destroy
    session.clear
    redirect_to home_path
  end

end
