class SzallitosController < ApplicationController
  before_action :set_szallito, only: %i[ show edit update destroy ]

  # GET /szallitos or /szallitos.json
  def index
    @szallitos = Szallito.all
  end

  # GET /szallitos/1 or /szallitos/1.json
  def show
  end

  # GET /szallitos/new
  def new
    @szallito = Szallito.new
  end

  # GET /szallitos/1/edit
  def edit
  end

  # POST /szallitos or /szallitos.json
  def create
    @szallito = Szallito.new(szallito_params)

    respond_to do |format|
      if @szallito.save
        format.html { redirect_to szallito_url(@szallito), notice: "Szallito was successfully created." }
        format.json { render :show, status: :created, location: @szallito }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @szallito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /szallitos/1 or /szallitos/1.json
  def update
    respond_to do |format|
      if @szallito.update(szallito_params)
        format.html { redirect_to szallito_url(@szallito), notice: "Szallito was successfully updated." }
        format.json { render :show, status: :ok, location: @szallito }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @szallito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /szallitos/1 or /szallitos/1.json
  def destroy
    @szallito.destroy

    respond_to do |format|
      format.html { redirect_to szallitos_url, notice: "Szallito was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_szallito
      @szallito = Szallito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def szallito_params
      params.require(:szallito).permit(:km_ar, :ar_kg)
    end
end
