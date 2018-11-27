class PaiementsolutionsController < ApplicationController
  before_action :set_paiementsolution, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  add_breadcrumb "Fichiers", :parametre_index_path
  add_breadcrumb "paramètre", :access_systeme_path
  layout 'views/index'
  # GET /paiementsolutions
  # GET /paiementsolutions.json
  def index
    @paiementsolutions = Paiementsolution.all
    add_breadcrumb "solutions de paiement", paiementsolutions_path
  end

  # GET /paiementsolutions/1
  # GET /paiementsolutions/1.json
  def show
  end

  # GET /paiementsolutions/new
  def new
    @paiementsolution = Paiementsolution.new
    add_breadcrumb 'solutions de paiement', :paiementsolutions_path
    add_breadcrumb 'nouvelle solution', :new_paiementsolution_path
  end

  # GET /paiementsolutions/1/edit
  def edit
  end

  # POST /paiementsolutions
  # POST /paiementsolutions.json
  def create
    @paiementsolution = Paiementsolution.new(paiementsolution_params)

    respond_to do |format|
      if @paiementsolution.save
        format.html { redirect_to @paiementsolution, notice: 'Paiementsolution was successfully created.' }
        format.json { render :show, status: :created, location: @paiementsolution }
      else
        format.html { render :new }
        format.json { render json: @paiementsolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paiementsolutions/1
  # PATCH/PUT /paiementsolutions/1.json
  def update
    respond_to do |format|
      if @paiementsolution.update(paiementsolution_params)
        format.html { redirect_to @paiementsolution, notice: 'Paiementsolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @paiementsolution }
      else
        format.html { render :edit }
        format.json { render json: @paiementsolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paiementsolutions/1
  # DELETE /paiementsolutions/1.json
  def destroy
    @paiementsolution.destroy
    respond_to do |format|
      format.html { redirect_to paiementsolutions_url, notice: 'Paiementsolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paiementsolution
      @paiementsolution = Paiementsolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paiementsolution_params
      params.require(:paiementsolution).permit(:name, :operator, :image)
    end
end
