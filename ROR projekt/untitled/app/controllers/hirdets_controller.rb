class HirdetsController < ApplicationController
  before_action :set_hirdet, only: %i[ show edit update destroy ]

  # GET /hirdets or /hirdets.json
  def index
    @hirdets = Hirdet.all
  end

  # GET /hirdets/1 or /hirdets/1.json
  def show
  end

  # GET /hirdets/new
  def new
    @hirdet = Hirdet.new
  end

  # GET /hirdets/1/edit
  def edit
  end

  # POST /hirdets or /hirdets.json
  def create
    @hirdet = Hirdet.new(hirdet_params)

    respond_to do |format|
      if @hirdet.save
        format.html { redirect_to hirdet_url(@hirdet), notice: "Hirdet was successfully created." }
        format.json { render :show, status: :created, location: @hirdet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hirdet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hirdets/1 or /hirdets/1.json
  def update
    respond_to do |format|
      if @hirdet.update(hirdet_params)
        format.html { redirect_to hirdet_url(@hirdet), notice: "Hirdet was successfully updated." }
        format.json { render :show, status: :ok, location: @hirdet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hirdet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hirdets/1 or /hirdets/1.json
  def destroy
    @hirdet.destroy

    respond_to do |format|
      format.html { redirect_to hirdets_url, notice: "Hirdet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hirdet
      @hirdet = Hirdet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hirdet_params
      params.require(:hirdet).permit(:felhaszn_id, :hirdetes_id, :mikor)
    end
end
