class RendelsController < ApplicationController
  before_action :set_rendel, only: %i[ show edit update destroy ]

  # GET /rendels or /rendels.json
  def index
    @rendels = Rendel.all
  end

  # GET /rendels/1 or /rendels/1.json
  def show
  end

  # GET /rendels/new
  def new
    @rendel = Rendel.new
  end

  # GET /rendels/1/edit
  def edit
  end

  # POST /rendels or /rendels.json
  def create
    @rendel = Rendel.new(rendel_params)

    respond_to do |format|
      if @rendel.save
        format.html { redirect_to rendel_url(@rendel), notice: "Rendel was successfully created." }
        format.json { render :show, status: :created, location: @rendel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rendel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rendels/1 or /rendels/1.json
  def update
    respond_to do |format|
      if @rendel.update(rendel_params)
        format.html { redirect_to rendel_url(@rendel), notice: "Rendel was successfully updated." }
        format.json { render :show, status: :ok, location: @rendel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rendel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rendels/1 or /rendels/1.json
  def destroy
    @rendel.destroy

    respond_to do |format|
      format.html { redirect_to rendels_url, notice: "Rendel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rendel
      @rendel = Rendel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rendel_params
      params.require(:rendel).permit(:felhaszn_id, :hirdetes_id, :szallito_id)
    end
end
