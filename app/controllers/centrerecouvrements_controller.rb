class CentrerecouvrementsController < ApplicationController
  before_action :set_centrerecouvrement, only: [:show, :edit, :update, :destroy]
  layout 'views/index'

  # GET /centrerecouvrements
  # GET /centrerecouvrements.json
  def index
    @centrerecouvrements = Centrerecouvrement.all
  end

  # GET /centrerecouvrements/1
  # GET /centrerecouvrements/1.json
  def show
  end

  # GET /centrerecouvrements/new
  def new
    @centrerecouvrement = Centrerecouvrement.new
  end

  # GET /centrerecouvrements/1/edit
  def edit
  end

  # POST /centrerecouvrements
  # POST /centrerecouvrements.json
  def create
    @centrerecouvrement = Centrerecouvrement.new(centrerecouvrement_params)

    respond_to do |format|
      if @centrerecouvrement.save
        format.html { redirect_to @centrerecouvrement, notice: 'Centrerecouvrement was successfully created.' }
        format.json { render :show, status: :created, location: @centrerecouvrement }
      else
        format.html { render :new }
        format.json { render json: @centrerecouvrement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centrerecouvrements/1
  # PATCH/PUT /centrerecouvrements/1.json
  def update
    respond_to do |format|
      if @centrerecouvrement.update(centrerecouvrement_params)
        format.html { redirect_to @centrerecouvrement, notice: 'Centrerecouvrement was successfully updated.' }
        format.json { render :show, status: :ok, location: @centrerecouvrement }
      else
        format.html { render :edit }
        format.json { render json: @centrerecouvrement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centrerecouvrements/1
  # DELETE /centrerecouvrements/1.json
  def destroy
    @centrerecouvrement.destroy
    respond_to do |format|
      format.html { redirect_to centrerecouvrements_url, notice: 'Centrerecouvrement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centrerecouvrement
      @centrerecouvrement = Centrerecouvrement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centrerecouvrement_params
      params.require(:centrerecouvrement).permit(:name, :phone, :region_id, :email, :localisation, :region_id)
    end
end
