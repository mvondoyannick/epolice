class ArchiveController < ApplicationController
  require 'base64'
  require 'httparty'

  layout 'fylo'

  def index
    #agent ayant le meme commissariat
    @agent = Agent.order(created_at: :asc).all
  end

  def get_contravention_from_agent
    current_agent = params[:agent_id]
    @archive = Convocation.new
    #@affectation = Affectation.where(agent_id: current_agent).where('fin >= ?', Date.today)
    @query = Convocation.where(agent_id: current_agent).order(created_at: :desc).where(created_at: Date.today.beginning_of_year..Date.today.end_of_year).where('pieceretenu_id > 0')
  end

  #permet de confirmer la reception du document recu
  def confirm_get_document
    code = params[:code]
    @request = Convocation.all.where(code: code)
  end

  def merci

  end

  def validate
    if params[:code].present?
      redirect_to action: 'merci'
    end
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
