class ArchiveController < ApplicationController
  require 'base64'
  require 'httparty'

  def index
    #agent ayant le meme commissariat
    @agent = Agent.where(commissariat_id: current_user.commissariat_id).order(created_at: :asc).all
    render layout: 'admin'
  end

  def get_contravention_from_agent
    current_agent = params[:agent_id]
    @archive = Convocation.new
    @query = Convocation.where(agent_id: current_agent).all
    render layout: 'admin'
  end

  #permet de confirmer la reception du document recu
  def confirm_get_document
    code = params[:code]
    @request = Convocation.all.where(code: code)
    render layout: 'admin'
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
    #render layout: 'admin'
  end

end
