class ErtekelsController < ApplicationController
  before_action :set_ertekel, only: %i[ show edit update destroy ]

  # GET /ertekels or /ertekels.json
  def index
    @ertekels = Ertekel.all
  end

  # GET /ertekels/1 or /ertekels/1.json
  def show
  end

  # GET /ertekels/new
  def new
    @ertekel = Ertekel.new
  end

  # GET /ertekels/1/edit
  def edit
  end

  # POST /ertekels or /ertekels.json
  def create
    @ertekel = Ertekel.new(ertekel_params)

    respond_to do |format|
      if @ertekel.save
        format.html { redirect_to ertekel_url(@ertekel), notice: "Ertekel was successfully created." }
        format.json { render :show, status: :created, location: @ertekel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ertekel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ertekels/1 or /ertekels/1.json
  def update
    respond_to do |format|
      if @ertekel.update(ertekel_params)
        format.html { redirect_to ertekel_url(@ertekel), notice: "Ertekel was successfully updated." }
        format.json { render :show, status: :ok, location: @ertekel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ertekel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ertekels/1 or /ertekels/1.json
  def destroy
    @ertekel.destroy

    respond_to do |format|
      format.html { redirect_to ertekels_url, notice: "Ertekel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ertekel
      @ertekel = Ertekel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ertekel_params
      params.require(:ertekel).permit(:felhaszn_id, :hirdetes_id, :csillag, :leiras)
    end
end
