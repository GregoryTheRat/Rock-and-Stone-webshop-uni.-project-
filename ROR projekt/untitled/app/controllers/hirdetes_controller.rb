class HirdetesController < ApplicationController
  before_action :set_hirdete, only: %i[ show edit update destroy ]

  # GET /hirdetes or /hirdetes.json
  def index
    @hirdetes = Hirdete.all
  end

  # GET /hirdetes/1 or /hirdetes/1.json
  def show
  end

  # GET /hirdetes/new
  def new
    @hirdete = Hirdete.new
  end

  # GET /hirdetes/1/edit
  def edit
  end

  # POST /hirdetes or /hirdetes.json
  def create
    @hirdete = Hirdete.new(hirdete_params)

    respond_to do |format|
      if @hirdete.save
        format.html { redirect_to hirdete_url(@hirdete), notice: "Hirdete was successfully created." }
        format.json { render :show, status: :created, location: @hirdete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hirdete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hirdetes/1 or /hirdetes/1.json
  def update
    respond_to do |format|
      if @hirdete.update(hirdete_params)
        format.html { redirect_to hirdete_url(@hirdete), notice: "Hirdete was successfully updated." }
        format.json { render :show, status: :ok, location: @hirdete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hirdete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hirdetes/1 or /hirdetes/1.json
  def destroy
    @hirdete.destroy

    respond_to do |format|
      format.html { redirect_to hirdetes_url, notice: "Hirdete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hirdete
      @hirdete = Hirdete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hirdete_params
      params.require(:hirdete).permit(:termek_nev, :mennyiseg, :ar_kg, :min_vasarlas)
    end
end
