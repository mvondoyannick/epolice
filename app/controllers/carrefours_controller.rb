class CarrefoursController < ApplicationController
  before_action :set_carrefour, only: [:show, :edit, :update, :destroy]

  # GET /carrefours
  # GET /carrefours.json
  def index
    @carrefours = Carrefour.all
  end

  def cartographie
    @title = "Cartographie des carrefours"
  end

  # GET /carrefours/1
  # GET /carrefours/1.json
  def show
  end

  # GET /carrefours/new
  def new
    @carrefour = Carrefour.new
  end

  # GET /carrefours/1/edit
  def edit
  end

  # POST /carrefours
  # POST /carrefours.json
  def create
    @carrefour = Carrefour.new(carrefour_params)

    respond_to do |format|
      if @carrefour.save
        format.html { redirect_to @carrefour, notice: 'Carrefour was successfully created.' }
        format.json { render :show, status: :created, location: @carrefour }
      else
        format.html { render :new }
        format.json { render json: @carrefour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carrefours/1
  # PATCH/PUT /carrefours/1.json
  def update
    respond_to do |format|
      if @carrefour.update(carrefour_params)
        format.html { redirect_to @carrefour, notice: 'Carrefour was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrefour }
      else
        format.html { render :edit }
        format.json { render json: @carrefour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrefours/1
  # DELETE /carrefours/1.json
  def destroy
    @carrefour.destroy
    respond_to do |format|
      format.html { redirect_to carrefours_url, notice: 'Carrefour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrefour
      @carrefour = Carrefour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrefour_params
      params.require(:carrefour).permit(:name, :quartier, :status, :image, :description)
    end
end
