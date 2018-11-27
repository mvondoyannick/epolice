class ConstatsController < ApplicationController
  before_action :set_constat, only: [:show, :edit, :update, :destroy]
  layout 'views/index'

  # GET /constats
  # GET /constats.json
  def index
    @constats = Constat.all
  end

  # GET /constats/1
  # GET /constats/1.json
  def show
  end

  # GET /constats/new
  def new
    @constat = Constat.new
  end

  # GET /constats/1/edit
  def edit
  end

  # POST /constats
  # POST /constats.json
  def create
    @constat = Constat.new(constat_params)

    respond_to do |format|
      if @constat.save
        format.html { redirect_to @constat, notice: 'Constat was successfully created.' }
        format.json { render :show, status: :created, location: @constat }
      else
        format.html { render :new }
        format.json { render json: @constat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constats/1
  # PATCH/PUT /constats/1.json
  def update
    respond_to do |format|
      if @constat.update(constat_params)
        format.html { redirect_to @constat, notice: 'Constat was successfully updated.' }
        format.json { render :show, status: :ok, location: @constat }
      else
        format.html { render :edit }
        format.json { render json: @constat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constats/1
  # DELETE /constats/1.json
  def destroy
    @constat.destroy
    respond_to do |format|
      format.html { redirect_to constats_url, notice: 'Constat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constat
      @constat = Constat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constat_params
      params.require(:constat).permit(:name1, :name2, :phone1, :phone2, :cni1, :cni2, :immatriculation1, :immatriculation2, :marque1, :marque2, :police1, :police2, :typeaccident_id)
    end
end
