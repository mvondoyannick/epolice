class ConvocationsController < ApplicationController
  before_action :set_convocation, only: [:show, :edit, :update, :destroy]
  before_action :basic_auth, only: [:new, :update, :destroy]
  require 'prawn'

  # GET /convocations
  # GET /convocations.json
  def index
    @convocations = Convocation.all.order(created_at: :desc)
    @title = "Toutes les convocations"
    @compteur = @convocations.count
    render layout: 'admin'
  end

  # GET /convocations/1
  # GET /convocations/1.json
  def show
    render layout: 'admin'
  end

  def home

  end

  # GET /convocation/not_paid
  def not_paid
    @not_paid = Convocation.all.where(status: "impaye")
    @title = "Convocations impayées"
    @compteur = @not_paid.count
  end

  # GET /convocation/paid
  def paid
    @paid = Convocation.all.where(status: "paye")
    @title = "Convocations payées"
    @compteur = @paid.count
  end

  # GET /convocation/auth/login
  def login
    
  end

  # GET /convocations/new
  def new
    @code = SecureRandom.hex(10).upcase
    @convocation = Convocation.new
    @description = "Creer une nouvelle convocation"
    render layout: 'admin'
  end

  # GET /convocations/1/edit
  def edit
    render layout: 'admin'
  end

  # le paiement
  def payer
    #permet de payer une convocation
    #on recuper l'ID de la convocation et on effectue la recherche avec
    id = params[:id]
    #on recherche le status de la convocation
    @d = Convocation.find(id)
  end

  #la facture
  def facture
    #affiche une facture à l'ecran
    id = params[:id]
    @f = Convocation.find(id)
  end


  #impression
  def print
    id = params[:id]
    @data = Convocation.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "RECU DE PAIEMENT DE L'AMENDE FORFAITAIRE \n"
        pdf.text "Nom et prénom diu contrevenant : #{@data.name} #{@data.prenom}"
        pdf.text "Nature et classe de la contravention : #{@data}"
        pdf.text "Proces verbal N° : #{@data}"
        pdf.text "Montant de l'amende forfaitaire : #{@data}"
        pdf.text "Date de versement : #{Time.now}"
        send_data pdf.render, filename: "ConvocationTest.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  #historique des convocations suivant le numero de CNI
  def historiqueCni
    cni = params[:cni]
    query = Convocation.where(cni: cni)
    if query.nil?
      redirect_back(fallback_location: root_path)
    else
      @data = query
    end
  end


  #historique des convocation suivant le numero de téléphone
  def historiquePhone
    phone = params[:phone]
    query = Convocation.where(phone: phone)
    if query.nil?
      redirect_back(fallback_location: root_path)
    else
      @data = query
    end
  end

  #historique suivant l'immatriculation du vehicule
  def historiqueImmatriculation
    imma = params[:immatriculation]
    query = Convocation.where(immatriculation: imma)
    if query.nil?
      redirect_back(fallback_location: root_path)
    else
      @data = query
    end
  end

  # POST /convocations
  # POST /convocations.json
  def create
    @convocation = Convocation.new(convocation_params)

    respond_to do |format|
      if @convocation.save
        format.html { redirect_to @convocation, notice: 'Convocation was successfully created.' }
        format.json { render :show, status: :created, location: @convocation }
      else
        puts "===== #{@convocation.errors.messages} ====="
        format.html { render :new }
        format.json { render json: @convocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /convocations/1
  # PATCH/PUT /convocations/1.json
  def update
    respond_to do |format|
      if @convocation.update(convocation_params)
        format.html { redirect_to @convocation, notice: 'Convocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @convocation }
      else
        format.html { render :edit }
        format.json { render json: @convocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convocations/1
  # DELETE /convocations/1.json
  def destroy
    @convocation.destroy
    respond_to do |format|
      format.html { redirect_to convocations_url, notice: 'Convocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convocation
      @convocation = Convocation.find(params[:id])
    end
  
    #authentification basic on rails framework
  def basic_auth
      authenticate_or_request_with_http_basic do |user, password|
        user == "agis" && password == "agis"
      end

  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convocation_params
      params.require(:convocation).permit(:cni, :phone, :name, :prenom, :immatriculation, :residence, :emploi, :motif, :observation, :pieceretenue, :ville, :quartier, :rue, :an, :sexe, :status, :agent_id, :code, :infraction_id)
    end
end
