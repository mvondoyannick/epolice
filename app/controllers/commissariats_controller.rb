class CommissariatsController < ApplicationController
  before_action :set_commissariat, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  layout 'fylo'
  add_breadcrumb "Fichiers", :parametre_index_path
  # GET /commissariats
  # GET /commissariats.json
  def index
    @commissariats = Commissariat.all
    add_breadcrumb "commissariats", :commissariats_path
  end

  # GET /commissariats/1
  # GET /commissariats/1.json
  def show
    add_breadcrumb "commissariats", :commissariats_path
    add_breadcrumb "details", :commissariat_path
  end

  # GET /commissariats/new
  def new
    @commissariat = Commissariat.new
    add_breadcrumb 'nouveau commissariat', :new_commissariat_path
  end

  # GET /commissariats/1/edit
  def edit
    add_breadcrumb "commissariats", :commissariats_path
    add_breadcrumb "editer", :commissariat_path
  end

  # POST /commissariats
  # POST /commissariats.json
  def create
    @commissariat = Commissariat.new(commissariat_params)

    respond_to do |format|
      if @commissariat.save
        format.html { redirect_to commissariats_path, notice: 'Commissariat was successfully created.' }
        format.json { render :show, status: :created, location: @commissariat }
      else
        format.html { render :new }
        format.json { render json: @commissariat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commissariats/1
  # PATCH/PUT /commissariats/1.json
  def update
    respond_to do |format|
      if @commissariat.update(commissariat_params)
        format.html { redirect_to @commissariat, notice: 'Commissariat was successfully updated.' }
        format.json { render :show, status: :ok, location: @commissariat }
      else
        format.html { render :edit }
        format.json { render json: @commissariat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commissariats/1
  # DELETE /commissariats/1.json
  def destroy
    @commissariat.destroy
    respond_to do |format|
      format.html { redirect_to commissariats_url, notice: 'Commissariat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commissariat
      @commissariat = Commissariat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commissariat_params
      params.require(:commissariat).permit(:name, :phone, :region_id, :departement_id, :arrondissement_id, :localisation, :email)
    end
end
