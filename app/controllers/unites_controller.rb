class UnitesController < ApplicationController
  before_action :set_unite, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  layout 'fylo'
  # GET /unites
  # GET /unites.json
  def index
    @unites = Unite.all
  end

  # GET /unites/1
  # GET /unites/1.json
  def show
  end

  # GET /unites/new
  def new
    @unite = Unite.new
  end

  # GET /unites/1/edit
  def edit
  end

  # POST /unites
  # POST /unites.json
  def create
    @unite = Unite.new(unite_params)

    respond_to do |format|
      if @unite.save
        format.html { redirect_to @unite, notice: 'Unite was successfully created.' }
        format.json { render :show, status: :created, location: @unite }
      else
        format.html { render :new }
        format.json { render json: @unite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unites/1
  # PATCH/PUT /unites/1.json
  def update
    respond_to do |format|
      if @unite.update(unite_params)
        format.html { redirect_to @unite, notice: 'Unite was successfully updated.' }
        format.json { render :show, status: :ok, location: @unite }
      else
        format.html { render :edit }
        format.json { render json: @unite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unites/1
  # DELETE /unites/1.json
  def destroy
    @unite.destroy
    respond_to do |format|
      format.html { redirect_to unites_url, notice: 'Unite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unite
      @unite = Unite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unite_params
      params.require(:unite).permit(:name)
    end
end
