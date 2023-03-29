class FelhasznalosController < ApplicationController
  before_action :set_felhasznalo, only: %i[ show edit update destroy ]

  # GET /felhasznalos or /felhasznalos.json
  def index
    @felhasznalos = Felhasznalo.all
  end

  # GET /felhasznalos/1 or /felhasznalos/1.json
  def show
  end

  # GET /felhasznalos/new
  def new
    @felhasznalo = Felhasznalo.new
  end

  # GET /felhasznalos/1/edit
  def edit
  end

  # POST /felhasznalos or /felhasznalos.json
  def create
    @felhasznalo = Felhasznalo.new(felhasznalo_params)

    respond_to do |format|
      if @felhasznalo.save
        format.html { redirect_to felhasznalo_url(@felhasznalo), notice: "Felhasznalo was successfully created." }
        format.json { render :show, status: :created, location: @felhasznalo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @felhasznalo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /felhasznalos/1 or /felhasznalos/1.json
  def update
    respond_to do |format|
      if @felhasznalo.update(felhasznalo_params)
        format.html { redirect_to felhasznalo_url(@felhasznalo), notice: "Felhasznalo was successfully updated." }
        format.json { render :show, status: :ok, location: @felhasznalo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @felhasznalo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /felhasznalos/1 or /felhasznalos/1.json
  def destroy
    @felhasznalo.destroy

    respond_to do |format|
      format.html { redirect_to felhasznalos_url, notice: "Felhasznalo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_felhasznalo
      @felhasznalo = Felhasznalo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def felhasznalo_params
      params.require(:felhasznalo).permit(:nev, :email, :jelszo)
    end
end
