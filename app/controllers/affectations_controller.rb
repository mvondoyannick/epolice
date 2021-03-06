class AffectationsController < ApplicationController
  before_action :set_affectation, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]

  add_breadcrumb "Index", :grvpc_index_path


  layout 'views/index'

  # GET /affectations
  # GET /affectations.json
  def index
    @affectations = Affectation.all
    #render layout: 'fylo'
    add_breadcrumb "affectations", :parametre_localisation_path
  end

  def home
    @affect = Affectation.all
    respond_to do |format|
      format.html do
        @affect
        #render layout: 'fylo'
      end
      format.json do
        render json: @affect
      end
    end
    #render layout: 'admin'
  end

  # GET /affectations/1
  # GET /affectations/1.json
  def show
  end

  # GET /affectations/new
  def new
    @affectation = Affectation.new
  end

  # GET /affectations/1/edit
  def edit
  end

  # POST /affectations
  # POST /affectations.json
  def create
    @affectation = Affectation.new(affectation_params)

    respond_to do |format|
      if @affectation.save
        format.html { redirect_to @affectation, notice: 'Affectation was successfully created.' }
        format.json { render :show, status: :created, location: @affectation }
      else
        format.html { render :new }
        format.json { render json: @affectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affectations/1
  # PATCH/PUT /affectations/1.json
  def update
    respond_to do |format|
      if @affectation.update(affectation_params)
        format.html { redirect_to @affectation, notice: 'Affectation was successfully updated.' }
        format.json { render :show, status: :ok, location: @affectation }
      else
        format.html { render :edit }
        format.json { render json: @affectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affectations/1
  # DELETE /affectations/1.json
  def destroy
    @affectation.destroy
    respond_to do |format|
      format.html { redirect_to affectations_url, notice: 'Affectation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affectation
      @affectation = Affectation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affectation_params
      params.require(:affectation).permit(:agent_id, :affectation_id, :carrefour_id, :debut, :fin, :token, :region_id, :commissariat_id, :postepolice_id, :localisation)
    end
end
