class CentrepartenairesController < ApplicationController
  before_action :set_centrepartenaire, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  layout 'views/index'

  # GET /centrepartenaires
  # GET /centrepartenaires.json
  def index
    @centrepartenaires = Centrepartenaire.all
  end

  # GET /centrepartenaires/1
  # GET /centrepartenaires/1.json
  def show
  end

  # GET /centrepartenaires/new
  def new
    @centrepartenaire = Centrepartenaire.new
  end

  # GET /centrepartenaires/1/edit
  def edit
  end

  # POST /centrepartenaires
  # POST /centrepartenaires.json
  def create
    @centrepartenaire = Centrepartenaire.new(centrepartenaire_params)

    respond_to do |format|
      if @centrepartenaire.save
        format.html { redirect_to @centrepartenaire, notice: 'Centrepartenaire was successfully created.' }
        format.json { render :show, status: :created, location: @centrepartenaire }
      else
        format.html { render :new }
        format.json { render json: @centrepartenaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centrepartenaires/1
  # PATCH/PUT /centrepartenaires/1.json
  def update
    respond_to do |format|
      if @centrepartenaire.update(centrepartenaire_params)
        format.html { redirect_to @centrepartenaire, notice: 'Centrepartenaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @centrepartenaire }
      else
        format.html { render :edit }
        format.json { render json: @centrepartenaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centrepartenaires/1
  # DELETE /centrepartenaires/1.json
  def destroy
    @centrepartenaire.destroy
    respond_to do |format|
      format.html { redirect_to centrepartenaires_url, notice: 'Centrepartenaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centrepartenaire
      @centrepartenaire = Centrepartenaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centrepartenaire_params
      params.require(:centrepartenaire).permit(:name, :structure_id, :region_id, :departement_id, :arrondissement_id, :localisation, :name, :prenom, :fonction, :phone, :email)
    end
end
