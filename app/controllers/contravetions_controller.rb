class ContravetionsController < ApplicationController
  before_action :set_contravetion, only: [:show, :edit, :update, :destroy]

  # GET /contravetions
  # GET /contravetions.json
  def index
    @contravetions = Contravetion.all
  end

  # GET /contravetions/1
  # GET /contravetions/1.json
  def show
  end

  # GET /contravetions/new
  def new
    @contravetion = Contravetion.new
  end

  # GET /contravetions/1/edit
  def edit
  end

  # POST /contravetions
  # POST /contravetions.json
  def create
    @contravetion = Contravetion.new(contravetion_params)

    respond_to do |format|
      if @contravetion.save
        format.html { redirect_to @contravetion, notice: 'Contravetion was successfully created.' }
        format.json { render :show, status: :created, location: @contravetion }
      else
        format.html { render :new }
        format.json { render json: @contravetion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contravetions/1
  # PATCH/PUT /contravetions/1.json
  def update
    respond_to do |format|
      if @contravetion.update(contravetion_params)
        format.html { redirect_to @contravetion, notice: 'Contravetion was successfully updated.' }
        format.json { render :show, status: :ok, location: @contravetion }
      else
        format.html { render :edit }
        format.json { render json: @contravetion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contravetions/1
  # DELETE /contravetions/1.json
  def destroy
    @contravetion.destroy
    respond_to do |format|
      format.html { redirect_to contravetions_url, notice: 'Contravetion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contravetion
      @contravetion = Contravetion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contravetion_params
      params.require(:contravetion).permit(:token, :motif, :status, :Agent_id, :User_id, :description)
    end
end
