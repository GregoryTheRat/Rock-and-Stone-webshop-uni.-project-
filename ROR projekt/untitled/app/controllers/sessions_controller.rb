class SessionsController < ApplicationController

  def new
  end
  def create
    user = User.find_by(nev: params[:nev])

    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin
        session[:admin]=true
      end
      redirect_to root_path
      flash[:notice] = 'Jó újra látni.'
    else
      redirect_to login_path
      flash[:notice] = 'Név és/vagy jelszó nem jó.'
    end
  end

  def profile
    @user = User.find_by(id: session[:user_id])
  end

end