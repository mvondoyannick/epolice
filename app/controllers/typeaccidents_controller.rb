class TypeaccidentsController < ApplicationController
  before_action :set_typeaccident, only: [:show, :edit, :update, :destroy]

  # GET /typeaccidents
  # GET /typeaccidents.json
  def index
    @typeaccidents = Typeaccident.all
  end

  # GET /typeaccidents/1
  # GET /typeaccidents/1.json
  def show
  end

  # GET /typeaccidents/new
  def new
    @typeaccident = Typeaccident.new
  end

  # GET /typeaccidents/1/edit
  def edit
  end

  # POST /typeaccidents
  # POST /typeaccidents.json
  def create
    @typeaccident = Typeaccident.new(typeaccident_params)

    respond_to do |format|
      if @typeaccident.save
        format.html { redirect_to @typeaccident, notice: 'Typeaccident was successfully created.' }
        format.json { render :show, status: :created, location: @typeaccident }
      else
        format.html { render :new }
        format.json { render json: @typeaccident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typeaccidents/1
  # PATCH/PUT /typeaccidents/1.json
  def update
    respond_to do |format|
      if @typeaccident.update(typeaccident_params)
        format.html { redirect_to @typeaccident, notice: 'Typeaccident was successfully updated.' }
        format.json { render :show, status: :ok, location: @typeaccident }
      else
        format.html { render :edit }
        format.json { render json: @typeaccident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typeaccidents/1
  # DELETE /typeaccidents/1.json
  def destroy
    @typeaccident.destroy
    respond_to do |format|
      format.html { redirect_to typeaccidents_url, notice: 'Typeaccident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeaccident
      @typeaccident = Typeaccident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typeaccident_params
      params.require(:typeaccident).permit(:name, :description)
    end
end
