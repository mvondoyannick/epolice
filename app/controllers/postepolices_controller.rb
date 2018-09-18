class PostepolicesController < ApplicationController
  before_action :set_postepolice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_grvpc!, only: [:new, :update, :destroy]

  layout 'admin'

  # GET /postepolices
  # GET /postepolices.json
  def index
    @postepolices = Postepolice.all
  end

  # GET /postepolices/1
  # GET /postepolices/1.json
  def show
  end

  # GET /postepolices/new
  def new
    @postepolice = Postepolice.new
  end

  # GET /postepolices/1/edit
  def edit
  end

  # POST /postepolices
  # POST /postepolices.json
  def create
    @postepolice = Postepolice.new(postepolice_params)

    respond_to do |format|
      if @postepolice.save
        format.html { redirect_to @postepolice, notice: 'Postepolice was successfully created.' }
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
      params.require(:postepolice).permit(:name, :location, :agent_id, :commissariat_id)
    end
end
