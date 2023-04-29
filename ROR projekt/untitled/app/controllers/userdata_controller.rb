class UserdataController < ApplicationController
  def profile
    @user = User.find_by(id: session[:user_id])
  end

  def updateprofile
    @user.update(user_params)
    redirect_to profile_path
  end

  def user_params
    params.require(:user).permit(:nev, :email)
  end
end