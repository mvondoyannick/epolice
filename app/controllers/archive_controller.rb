class ArchiveController < ApplicationController
  require 'base64'
  require 'httparty'
  require 'rqrcode'
  HTTParty::Basement.default_options.update(verify: false)
  add_breadcrumb "Dashboard", :grvpc_index_path

  layout 'grvpc/grvpc', except: [:send_document]

  def index
    #agent ayant le meme commissariat
    @agent = Agent.order(created_at: :asc).all
    add_breadcrumb "Acceuil", archive_index_path
  end

  def get_contravention_from_agent
    current_agent = params[:agent_id]
    @archive = Convocation.new
    #@affectation = Affectation.where(agent_id: current_agent).where('fin >= ?', Date.today)
    @query = Convocation.where(agent_id: current_agent).order(created_at: :desc).where(created_at: Date.today.beginning_of_year..Date.today.end_of_year).where('pieceretenu_id > 0')
    add_breadcrumb "liste contravention", nil
  end

  #permet de confirmer la reception du document recu
  def confirm_get_document
    c = Base64.decode64(params[:contravention])
    a = Base64.decode64(params[:agent])
    @request = Convocation.find(c)
    @agent = Agent.find(a)
    @qrcode = Base64.encode64(@request.pieceretenu_id.to_s)

    qrcode = RQRCode::QRCode.new('http://github.com/')


  end

  def merci
    @agent  = params[:agent]
    @data   = params[:data]

    #demarrage du processus de notification via SMS
    phone = Agent.find(@agent).phone
    current_convocation = Convocation.find(@data)
    #message = "Valider la transmission du documents #{current_convocation.pieceretenu.name} correspondant a l infraction du #{current_convocation.created_at} faites par vous (#{Agent.find(@agent).complete_name}) a l agent #{current_admin.email}."
    #HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{phone}&message=#{message}")
  end

  def validate
    if params[:code].present?
      redirect_to action: 'merci'
    end
  end

  #pour la transmission d'un document par un agent
  def send_document
    phone = params[:phone]
    matricule = params[:matricule]

    #recherche à authentifier l'agent
    @agent = Agent.where(phone: phone, matricule: matricule).first
    if !@agent.nil?
      @con = Convocation.where(agent_id: @agent.id).where('pieceretenu_id > 0').where(created_at: Date.today.beginning_of_year..Date.today.end_of_year)
    end
    render layout: 'template/archive/index'
  end

  def set_transmission
    code = params[:code]

    #on envoi les informations vers le nouvel agents superieur
    convocation = Convocation.find_by_code(code)
    convocation.agent_id = current_user.id
    if convocation.save
      code = rand(1000000)
      message = "entrer le code #{code} dans le lien http://192.168.1.244:3000/archive/validate"
      HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{convocation.agent.phone}&message=#{message}")
      redirect_to action: 'index'
    else
      puts " une erreur est survvenue"
      puts convocation.errors.messages
      HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{convocation.phone}&message=#{convocation.errors.messages}")
    end
  end

end
