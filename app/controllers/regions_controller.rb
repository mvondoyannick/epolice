class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  add_breadcrumb "Acceuil", :parametre_index_path
  add_breadcrumb "découpage administratif", :parametre_localisation_path
  #add_breadcrumb "gestion des region", :regions_path
  layout 'views/index'
  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.order(name: :asc).all
    add_breadcrumb "regions", :regions_path
  end

  def new_release
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    add_breadcrumb "details", :region_path
  end

  # GET /regions/new
  def new
    @region = Region.new
    add_breadcrumb "nouvelle région", :new_region_path
  end

  # GET /regions/1/edit
  def edit
    add_breadcrumb 'editer', :arrondissement_path
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to regions_path, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name)
    end
end
