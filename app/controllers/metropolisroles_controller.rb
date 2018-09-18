class MetropolisrolesController < ApplicationController
  before_action :set_metropolisrole, only: [:show, :edit, :update, :destroy]

  # GET /metropolisroles
  # GET /metropolisroles.json
  def index
    @metropolisroles = Metropolisrole.all
  end

  # GET /metropolisroles/1
  # GET /metropolisroles/1.json
  def show
  end

  # GET /metropolisroles/new
  def new
    @metropolisrole = Metropolisrole.new
  end

  # GET /metropolisroles/1/edit
  def edit
  end

  # POST /metropolisroles
  # POST /metropolisroles.json
  def create
    @metropolisrole = Metropolisrole.new(metropolisrole_params)

    respond_to do |format|
      if @metropolisrole.save
        format.html { redirect_to @metropolisrole, notice: 'Metropolisrole was successfully created.' }
        format.json { render :show, status: :created, location: @metropolisrole }
      else
        format.html { render :new }
        format.json { render json: @metropolisrole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metropolisroles/1
  # PATCH/PUT /metropolisroles/1.json
  def update
    respond_to do |format|
      if @metropolisrole.update(metropolisrole_params)
        format.html { redirect_to @metropolisrole, notice: 'Metropolisrole was successfully updated.' }
        format.json { render :show, status: :ok, location: @metropolisrole }
      else
        format.html { render :edit }
        format.json { render json: @metropolisrole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metropolisroles/1
  # DELETE /metropolisroles/1.json
  def destroy
    @metropolisrole.destroy
    respond_to do |format|
      format.html { redirect_to metropolisroles_url, notice: 'Metropolisrole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metropolisrole
      @metropolisrole = Metropolisrole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metropolisrole_params
      params.require(:metropolisrole).permit(:name, :description)
    end
end
