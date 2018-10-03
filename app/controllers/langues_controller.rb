class LanguesController < ApplicationController
  before_action :set_langue, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'fylo'
  # GET /langues
  # GET /langues.json
  def index
    @langues = Langue.all
  end

  # GET /langues/1
  # GET /langues/1.json
  def show
  end

  # GET /langues/new
  def new
    @langue = Langue.new
  end

  # GET /langues/1/edit
  def edit
  end

  # POST /langues
  # POST /langues.json
  def create
    @langue = Langue.new(langue_params)

    respond_to do |format|
      if @langue.save
        format.html { redirect_to @langue, notice: 'Langue was successfully created.' }
        format.json { render :show, status: :created, location: @langue }
      else
        format.html { render :new }
        format.json { render json: @langue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /langues/1
  # PATCH/PUT /langues/1.json
  def update
    respond_to do |format|
      if @langue.update(langue_params)
        format.html { redirect_to @langue, notice: 'Langue was successfully updated.' }
        format.json { render :show, status: :ok, location: @langue }
      else
        format.html { render :edit }
        format.json { render json: @langue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /langues/1
  # DELETE /langues/1.json
  def destroy
    @langue.destroy
    respond_to do |format|
      format.html { redirect_to langues_url, notice: 'Langue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_langue
      @langue = Langue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def langue_params
      params.require(:langue).permit(:name)
    end
end
