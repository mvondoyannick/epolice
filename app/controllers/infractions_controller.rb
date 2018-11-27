class InfractionsController < ApplicationController
  before_action :set_infraction, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  add_breadcrumb "Acceuil", :parametre_index_path
  add_breadcrumb "gestion des infractions", :infractions_path
  layout 'views/index'
  # GET /infractions
  # GET /infractions.json
  def index
    respond_to do |format|
      format.html do
        @infractions = Infraction.all
      end
      format.xls
    end
    add_breadcrumb "infractions", :infractions_path
    #@title = "Liste des infractions"
    #@compteur = Infraction.all.count
  end

  # GET /infractions/1
  # GET /infractions/1.json
  def show
    add_breadcrumb "details", :infractions_path
  end

  # GET /infractions/new
  def new
    @infraction = Infraction.new
    add_breadcrumb "nouvelle infraction", :infractions_path
  end

  # GET /infractions/1/edit
  def edit
    add_breadcrumb "editer", :infraction_path
  end

  # POST /infractions
  # POST /infractions.json
  def create
    @infraction = Infraction.new(infraction_params)

    respond_to do |format|
      if @infraction.save
        format.html { redirect_to @infraction, notice: 'Infraction was successfully created.' }
        format.json { render :show, status: :created, location: @infraction }
      else
        format.html { render :new }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infractions/1
  # PATCH/PUT /infractions/1.json
  def update
    respond_to do |format|
      if @infraction.update(infraction_params)
        format.html { redirect_to @infraction, notice: 'Infraction was successfully updated.' }
        format.json { render :show, status: :ok, location: @infraction }
      else
        format.html { render :edit }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infractions/1
  # DELETE /infractions/1.json
  def destroy
    @infraction.destroy
    respond_to do |format|
      format.html { redirect_to infractions_url, notice: 'Infraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infraction
      @infraction = Infraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infraction_params
      params.require(:infraction).permit(:motif, :montant, :source, :zonecouverturemotif_id, :region_id, :departement_id, :arrondissement_id, :classe)
    end
end
