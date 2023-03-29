class MitszallitsController < ApplicationController
  before_action :set_mitszallit, only: %i[ show edit update destroy ]

  # GET /mitszallits or /mitszallits.json
  def index
    @mitszallits = Mitszallit.all
  end

  # GET /mitszallits/1 or /mitszallits/1.json
  def show
  end

  # GET /mitszallits/new
  def new
    @mitszallit = Mitszallit.new
  end

  # GET /mitszallits/1/edit
  def edit
  end

  # POST /mitszallits or /mitszallits.json
  def create
    @mitszallit = Mitszallit.new(mitszallit_params)

    respond_to do |format|
      if @mitszallit.save
        format.html { redirect_to mitszallit_url(@mitszallit), notice: "Mitszallit was successfully created." }
        format.json { render :show, status: :created, location: @mitszallit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mitszallit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mitszallits/1 or /mitszallits/1.json
  def update
    respond_to do |format|
      if @mitszallit.update(mitszallit_params)
        format.html { redirect_to mitszallit_url(@mitszallit), notice: "Mitszallit was successfully updated." }
        format.json { render :show, status: :ok, location: @mitszallit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mitszallit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mitszallits/1 or /mitszallits/1.json
  def destroy
    @mitszallit.destroy

    respond_to do |format|
      format.html { redirect_to mitszallits_url, notice: "Mitszallit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mitszallit
      @mitszallit = Mitszallit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mitszallit_params
      params.require(:mitszallit).permit(:mit, :mennyiseg, :ar_kg, :min_vasarlas)
    end
end
