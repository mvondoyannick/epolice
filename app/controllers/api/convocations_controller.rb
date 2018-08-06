class Api::ConvocationsController < ApplicationController
  require 'net/http'
  require 'uri'

  #authentification d'un agent sur la plateforme
  def authUser
    phone = params[:phone]
    matricule = params[:matricule]

    #verification des information recu
    @token = Agent.where(phone: phone, matricule: matricule)
    if @token.empty?
      render json: {
        status: :not_found,
        message: :agent_inconnu,
        code: "404",
      }
    else
      render json: {
        status: :found,
        message: @token,
        code: 200,
        blue_print: SecureRandom.hex(10)
      }
    end
  end

  #permet de verifier une contravention
  def verifyContravention
    code = params[:code]
    @p = Convocation.find_by_code(code.upcase)
    if @p.nil?
      render json: {
        status: :not_found,
        message: "téléphone inconnu"
      }
    else
      if @p.status == "impaye"
        render json: {
            status: "code_unused",
            message: "Ce code est impayé"
        }
      else
        if @p.used == "utilise"
          render json: {
              status: :code_used,
              message: "Ce code est deja utilisé"
          }
        else
          #mise ajour de l'information avant affichage
          data = Convocation.find_by_code(@p.code)
          data.update(used: "utilise")
          render json: {
              status: :found,
              message: @p.status,
              phone: @p.phone,
              cni: @p.cni,
              immatriculation: @p.immatriculation
          }
        end
      end
    end
  end

  #gestion des alertes
  def alerteReq
    titre = params[:titre]
    description = params[:description]
    date = params[:date]
    ville = params[:ville_id]
    type = params[:type_id]
    agent = params[:agent_id]
    status = "unresolve"

    #creation d'une alerte
    query = Alerte.new(titre: titre, description: description, date: date, ville_id: ville, type_id: type, agent_id: agent, status: status)
    if query.save
      render json: {
          status: :created,
          message: query
      }
    else
      render json: {
          status: :not_created,
          message: "une erreur est survenue"
      }
    end
  end

  # GET /convocations/new
  def conv
    cni = params[:cni]
    phone = params[:phone]
    immatriculation  = params[:immatriculation]
    motif = params[:motif]
    pieceretenue = params[:pieceretenue]
    agent = params[:agent]
    status = "impaye"
    code = SecureRandom.hex(3)

    @result = Convocation.new(cni: cni, phone: phone, immatriculation: immatriculation, motif: motif, pieceretenue: pieceretenue, status: status, agent_id: agent, code: code.upcase)
    if @result.save
      render json: {
        status: :save,
        message: :created,
        data: @result
      }
      uri = URI.parse("http://textbelt.com/text")
      Net::HTTP.post_form(uri, {
          :phone => '+237691451189',
          :message => 'Hello world',
          :key => 'e0cc5680081956c7d206955ddc96ae9f58ae53044H9HtTWAkm6ApR6MV285mFTT4',
      })
    else
      render json: {
        status: :unprocessable_entity,
        message: @result.errors,
        data: @result
      }.to_json    
    end
  end

  #GET ALERTS 
  #permet de creer une nouvelle alerte
  def new_alerte
    quartier = params[:quartier]
    coordonnee = params[:coordonnees]
    description = params[:description]
    photo = params[:photo]
    type = params[:type]
    agent = params[:matricule]
    
  end
end
