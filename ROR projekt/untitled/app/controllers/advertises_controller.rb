class AdvertisesController < ApplicationController
  before_action :set_advertise, only: %i[ show edit update destroy ]

  # GET /advertises or /advertises.json
  def index
    @advertises = Advertise.all
  end
  # GET /advertises/1 or /advertises/1.json
  def show
  end

  # GET /advertises/new
  def new
    @advertise = Advertise.new
  end

  # GET /advertises/1/edit
  def edit
  end

  # POST /advertises or /advertises.json
  def create
    @advertise = Advertise.new(advertise_params)

    respond_to do |format|
      if @advertise.save
        format.html { redirect_to advertise_url(@advertise), notice: "Advertise was successfully created." }
        format.json { render :show, status: :created, location: @advertise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertises/1 or /advertises/1.json
  def update
    respond_to do |format|
      if @advertise.update(advertise_params)
        format.html { redirect_to advertise_url(@advertise), notice: "Advertise was successfully updated." }
        format.json { render :show, status: :ok, location: @advertise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertises/1 or /advertises/1.json
  def destroy
    @advertise.destroy

    respond_to do |format|
      format.html { redirect_to advertises_url, notice: "Advertise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advertise_params
      params.require(:advertise).permit(:user_id, :advert_id, :mikor)
    end
end
