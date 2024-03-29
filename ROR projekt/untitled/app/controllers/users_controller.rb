class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end



  def all_users
    query_result=ActiveRecord::Base.connection.exec_query("SELECT users.nev, users.email,users.id, COUNT(rates.id) AS num_ratings
FROM users
LEFT JOIN rates ON rates.user_id = users.id
GROUP BY users.nev, users.email,users.id"

    )

    @users = query_result.to_a

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create

    @user = User.new(user_params)
    if @user.save #sikeres mentés
      session[:user_id] = @user.id
      redirect_to root_path #vissza megyünk home
    else #sikertelen mentés
      render :new #vissza
    end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to home_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    session.clear
    respond_to do |format|
      format.html { redirect_to home_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nev, :email, :password)
    end
end
