class ArrondissementsController < ApplicationController
  before_action :set_arrondissement, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  add_breadcrumb "Acceuil", :parametre_index_path
  add_breadcrumb "gestion des arrondissements", :arrondissements_path
  layout 'fylo'
  # GET /arrondissements
  # GET /arrondissements.json
  def index
    @arrondissements = Arrondissement.all
    add_breadcrumb 'arrondissements', :arrondissements_path
  end

  # GET /arrondissements/1
  # GET /arrondissements/1.json
  def show
    add_breadcrumb 'details', :arrondissement_path
  end

  # GET /arrondissements/new
  def new
    @arrondissement = Arrondissement.new
    add_breadcrumb 'nouvel arrondissement', :new_arrondissement_path
  end

  # GET /arrondissements/1/edit
  def edit
    add_breadcrumb 'editer', :arrondissement_path
  end

  # POST /arrondissements
  # POST /arrondissements.json
  def create
    @arrondissement = Arrondissement.new(arrondissement_params)

    respond_to do |format|
      if @arrondissement.save
        format.html { redirect_to arrondissements_path, notice: 'Arrondissement was successfully created.' }
        format.json { render :show, status: :created, location: @arrondissement }
      else
        format.html { render :new }
        format.json { render json: @arrondissement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arrondissements/1
  # PATCH/PUT /arrondissements/1.json
  def update
    respond_to do |format|
      if @arrondissement.update(arrondissement_params)
        format.html { redirect_to @arrondissement, notice: 'Arrondissement was successfully updated.' }
        format.json { render :show, status: :ok, location: @arrondissement }
      else
        format.html { render :edit }
        format.json { render json: @arrondissement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arrondissements/1
  # DELETE /arrondissements/1.json
  def destroy
    @arrondissement.destroy
    respond_to do |format|
      format.html { redirect_to arrondissements_url, notice: 'Arrondissement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrondissement
      @arrondissement = Arrondissement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrondissement_params
      params.require(:arrondissement).permit(:name, :region_id, :departement_id)
    end
end
