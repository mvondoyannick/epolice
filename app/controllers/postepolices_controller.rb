class PostepolicesController < ApplicationController
  before_action :set_postepolice, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  #before_action :authenticate_grvpc!, only: [:new, :update, :destroy]
  add_breadcrumb "Fichiers", :parametre_index_path

  layout 'fylo'

  # GET /postepolices
  # GET /postepolices.json
  def index
    @postepolices = Postepolice.all
    add_breadcrumb 'postes de police', :postepolices_path
  end

  # GET /postepolices/1
  # GET /postepolices/1.json
  def show
    add_breadcrumb 'postes de police', :postepolices_path
    add_breadcrumb 'details', :postepolice_path
  end

  # GET /postepolices/new
  def new
    @postepolice = Postepolice.new
    add_breadcrumb 'postes de police', :postepolices_path
    add_breadcrumb 'nouveau poste de police', new_postepolice_path
  end

  # GET /postepolices/1/edit
  def edit
    add_breadcrumb 'postes de police', :postepolices_path
    add_breadcrumb 'editer', :postepolice_path
  end

  # POST /postepolices
  # POST /postepolices.json
  def create
    @postepolice = Postepolice.new(postepolice_params)

    respond_to do |format|
      if @postepolice.save
        format.html { redirect_to postepolices_path, notice: 'Postepolice was successfully created.' }
        format.json { render :show, status: :created, location: @postepolice }
      else
        format.html { render :new }
        format.json { render json: @postepolice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postepolices/1
  # PATCH/PUT /postepolices/1.json
  def update
    respond_to do |format|
      if @postepolice.update(postepolice_params)
        format.html { redirect_to @postepolice, notice: 'Postepolice was successfully updated.' }
        format.json { render :show, status: :ok, location: @postepolice }
      else
        format.html { render :edit }
        format.json { render json: @postepolice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postepolices/1
  # DELETE /postepolices/1.json
  def destroy
    @postepolice.destroy
    respond_to do |format|
      format.html { redirect_to postepolices_url, notice: 'Postepolice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postepolice
      @postepolice = Postepolice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postepolice_params
      params.require(:postepolice).permit(:name, :location, :commissariat_id, :region_id)
    end
end
