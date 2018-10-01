class ZonecouverturemotifsController < ApplicationController
  before_action :set_zonecouverturemotif, only: [:show, :edit, :update, :destroy]
  layout 'fylo'
  # GET /zonecouverturemotifs
  # GET /zonecouverturemotifs.json
  def index
    @zonecouverturemotifs = Zonecouverturemotif.all
  end

  # GET /zonecouverturemotifs/1
  # GET /zonecouverturemotifs/1.json
  def show
  end

  # GET /zonecouverturemotifs/new
  def new
    @zonecouverturemotif = Zonecouverturemotif.new
  end

  # GET /zonecouverturemotifs/1/edit
  def edit
  end

  # POST /zonecouverturemotifs
  # POST /zonecouverturemotifs.json
  def create
    @zonecouverturemotif = Zonecouverturemotif.new(zonecouverturemotif_params)

    respond_to do |format|
      if @zonecouverturemotif.save
        format.html { redirect_to @zonecouverturemotif, notice: 'Zonecouverturemotif was successfully created.' }
        format.json { render :show, status: :created, location: @zonecouverturemotif }
      else
        format.html { render :new }
        format.json { render json: @zonecouverturemotif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zonecouverturemotifs/1
  # PATCH/PUT /zonecouverturemotifs/1.json
  def update
    respond_to do |format|
      if @zonecouverturemotif.update(zonecouverturemotif_params)
        format.html { redirect_to @zonecouverturemotif, notice: 'Zonecouverturemotif was successfully updated.' }
        format.json { render :show, status: :ok, location: @zonecouverturemotif }
      else
        format.html { render :edit }
        format.json { render json: @zonecouverturemotif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zonecouverturemotifs/1
  # DELETE /zonecouverturemotifs/1.json
  def destroy
    @zonecouverturemotif.destroy
    respond_to do |format|
      format.html { redirect_to zonecouverturemotifs_url, notice: 'Zonecouverturemotif was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zonecouverturemotif
      @zonecouverturemotif = Zonecouverturemotif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zonecouverturemotif_params
      params.require(:zonecouverturemotif).permit(:name, :detail)
    end
end
