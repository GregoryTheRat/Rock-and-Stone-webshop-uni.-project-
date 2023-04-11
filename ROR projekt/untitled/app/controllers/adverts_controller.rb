class AdvertsController < ApplicationController
  before_action :set_advert, only: %i[ show edit update destroy ]

  # GET /adverts or /adverts.json
  def index
    @adverts = Advert.all
  end

  # GET /adverts/1 or /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts or /adverts.json
  def create
    @advert = Advert.new(advert_params)

    respond_to do |format|
      if @advert.save
        format.html { redirect_to advert_url(@advert), notice: "Advert was successfully created." }
        format.json { render :show, status: :created, location: @advert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1 or /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to advert_url(@advert), notice: "Advert was successfully updated." }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1 or /adverts/1.json
  def destroy
    @advert.destroy

    respond_to do |format|
      format.html { redirect_to adverts_url, notice: "Advert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advert_params
      params.require(:advert).permit(:termek_nev, :mennyiseg, :ar_kg, :min_vasarlas)
    end
end
