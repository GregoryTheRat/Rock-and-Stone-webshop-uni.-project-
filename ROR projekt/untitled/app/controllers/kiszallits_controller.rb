class KiszallitsController < ApplicationController
  before_action :set_kiszallit, only: %i[ show edit update destroy ]

  # GET /kiszallits or /kiszallits.json
  def index
    @kiszallits = Kiszallit.all
  end

  # GET /kiszallits/1 or /kiszallits/1.json
  def show
  end

  # GET /kiszallits/new
  def new
    @kiszallit = Kiszallit.new
  end

  # GET /kiszallits/1/edit
  def edit
  end

  # POST /kiszallits or /kiszallits.json
  def create
    @kiszallit = Kiszallit.new(kiszallit_params)

    respond_to do |format|
      if @kiszallit.save
        format.html { redirect_to kiszallit_url(@kiszallit), notice: "Kiszallit was successfully created." }
        format.json { render :show, status: :created, location: @kiszallit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kiszallit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kiszallits/1 or /kiszallits/1.json
  def update
    respond_to do |format|
      if @kiszallit.update(kiszallit_params)
        format.html { redirect_to kiszallit_url(@kiszallit), notice: "Kiszallit was successfully updated." }
        format.json { render :show, status: :ok, location: @kiszallit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kiszallit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kiszallits/1 or /kiszallits/1.json
  def destroy
    @kiszallit.destroy

    respond_to do |format|
      format.html { redirect_to kiszallits_url, notice: "Kiszallit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kiszallit
      @kiszallit = Kiszallit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kiszallit_params
      params.require(:kiszallit).permit(:rendel_id, :szallito_id, :mennyiseg, :hova, :koltseg, :varhato_szallitas)
    end
end
