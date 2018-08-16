class AlertesController < ApplicationController
  before_action :set_alerte, only: [:show, :edit, :update, :destroy]
  require 'net/http'
  require 'json'

  def parseUri(adresse)
    url = adresse.to_s
    uri = URI(url)
    response = Net::HTTP(uri)
    @response = JSON.parse(response)
  end

  #render layout: 'admin'
  # GET /alertes
  # GET /alertes.json
  def index
    @alertes = Alerte.all
    render layout: 'admin'
  end

  # GET /alertes/1
  # GET /alertes/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Alerte #{@alerte.code}"
        #send_data pdf.render, filename: "document_#{@alerte.code}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
    render layout: 'admin'
  end

  # GET /alertes/new
  def new
    @alerte = Alerte.new
    render layout: 'admin'
  end

  # GET /alertes/1/edit
  def edit
    render layout: 'admin'
  end

  #Affiche les alertes encors
  def currentAlerte
    query = Alerte.where(status: "current")
    if query.nil?
      redirect_back(fallback_location: root_path)
    else
      @query = query
    end
  end

  # POST /alertes
  # POST /alertes.json
  def create
    @alerte = Alerte.new(alerte_params)

    respond_to do |format|
      if @alerte.save
        format.html { redirect_to @alerte, notice: 'Alerte was successfully created.' }
        format.json { render :show, status: :created, location: @alerte }
      else
        format.html { render :new }
        format.json { render json: @alerte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alertes/1
  # PATCH/PUT /alertes/1.json
  def update
    respond_to do |format|
      if @alerte.update(alerte_params)
        format.html { redirect_to @alerte, notice: 'Alerte was successfully updated.' }
        format.json { render :show, status: :ok, location: @alerte }
      else
        format.html { render :edit }
        format.json { render json: @alerte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alertes/1
  # DELETE /alertes/1.json
  def destroy
    @alerte.destroy
    respond_to do |format|
      format.html { redirect_to alertes_url, notice: 'Alerte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alerte
      @alerte = Alerte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alerte_params
      params.require(:alerte).permit(:titre, :description, :date, :ville_id, :type_id, :agent_id, :action, :lieu, :status, :longitude, :latitude, :alertes)
    end
end
