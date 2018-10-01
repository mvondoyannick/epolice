class PieceretenusController < ApplicationController
  before_action :set_pieceretenu, only: [:show, :edit, :update, :destroy]
  layout 'fylo'
  # GET /pieceretenus
  # GET /pieceretenus.json
  def index
    @pieceretenus = Pieceretenu.all
  end

  # GET /pieceretenus/1
  # GET /pieceretenus/1.json
  def show
  end

  # GET /pieceretenus/new
  def new
    @pieceretenu = Pieceretenu.new
  end

  # GET /pieceretenus/1/edit
  def edit
  end

  # POST /pieceretenus
  # POST /pieceretenus.json
  def create
    @pieceretenu = Pieceretenu.new(pieceretenu_params)

    respond_to do |format|
      if @pieceretenu.save
        format.html { redirect_to @pieceretenu, notice: 'Pieceretenu was successfully created.' }
        format.json { render :show, status: :created, location: @pieceretenu }
      else
        format.html { render :new }
        format.json { render json: @pieceretenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pieceretenus/1
  # PATCH/PUT /pieceretenus/1.json
  def update
    respond_to do |format|
      if @pieceretenu.update(pieceretenu_params)
        format.html { redirect_to @pieceretenu, notice: 'Pieceretenu was successfully updated.' }
        format.json { render :show, status: :ok, location: @pieceretenu }
      else
        format.html { render :edit }
        format.json { render json: @pieceretenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieceretenus/1
  # DELETE /pieceretenus/1.json
  def destroy
    @pieceretenu.destroy
    respond_to do |format|
      format.html { redirect_to pieceretenus_url, notice: 'Pieceretenu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pieceretenu
      @pieceretenu = Pieceretenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pieceretenu_params
      params.require(:pieceretenu).permit(:name, :detail)
    end
end
