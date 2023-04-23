class CarriesController < ApplicationController
  before_action :set_carry, only: %i[ show edit update destroy ]

  # GET /carries or /carries.json
  def index
    @carries = Carry.all
  end

  # GET /carries/1 or /carries/1.json
  def show
  end

  # GET /carries/new
  def new
    @carry = Carry.new
  end

  # GET /carries/1/edit
  def edit
  end

  # POST /carries or /carries.json
  def create
    @carry = Carry.new(carry_params)

    respond_to do |format|
      if @carry.save
        format.html { redirect_to carry_url(@carry), notice: "Carry was successfully created." }
        format.json { render :show, status: :created, location: @carry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carries/1 or /carries/1.json
  def update
    respond_to do |format|
      if @carry.update(carry_params)
        format.html { redirect_to carry_url(@carry), notice: "Carry was successfully updated." }
        format.json { render :show, status: :ok, location: @carry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carries/1 or /carries/1.json
  def destroy
    @carry.destroy

    respond_to do |format|
      format.html { redirect_to carries_url, notice: "Carry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carry
      @carry = Carry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carry_params
      params.require(:carry).permit(:supplier_id, :mit)
    end
end
