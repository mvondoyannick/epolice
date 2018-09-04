class Api::ConvocationsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'httparty'
  require 'base64'

  #autoriser les connexion en https
  HTTParty::Basement.default_options.update(verify: false)

  #authentification d'un agent sur la plateforme
  def authUser
    phone = params[:phone]
    matricule = params[:matricule]

    #verification des information recu
    token = Agent.where(phone: phone, matricule: matricule)
    if token.empty?
      render json: {
        status: :not_found,
        message: :agent_inconnu,
        code: "404",
      }
    else
      render json: {
        status: :found,
        message: token,
        ville: token[0].ville.name,
        ville_id: token[0].ville_id,
        apikey: SecureRandom.hex(10),
        code: 200,
        cookies:  {value: SecureRandom.hex(10), expires: 1.hour.from_now }
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
    query = Alerte.new(
        titre: titre,
        description: description,
        date: date,
        ville_id: ville,
        type_id: type,
        agent_id: agent,
        status: status
    )
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


  #retourner tous les types au format json pour l'API
  def api_type
    render json: {types: Type.all}
  end

  # GET /convocations/new
  # permet la creation d'une convocation
  def conv
    cni = params[:cni]
    phone = params[:phone]
    immatriculation  = params[:immatriculation]
    motif = params[:motif]
    pieceretenue = params[:pieceretenue]
    agent = params[:agent]
    status = "impaye"
    code = SecureRandom.hex(3)

    #il faudra verifier si l'utilisateur et son téléphone sont authorisé

    @result = Convocation.new(cni: cni, phone: phone, immatriculation: immatriculation, motif: motif, pieceretenue: pieceretenue, status: status, agent_id: agent, code: code.upcase)
    if @result.save
      #c'est ok, on envoi le SMS
      sms = SmsapiRails.send_sms phone, "La CNI #{cni} est verbalisé pour #{@result.infraction.motif}, cout: #{@result.infraction.montant}. plus sur https://pop-circulation.herokuapp.com/user/public/c/#{@result.code}"
      puts "===== #{sms} ====="
      if sms.status == 'ok' && sms.success?
        render json: {
            status: :save,
            message: :created,
            data: @result
        }
      end

      #uri = URI.parse("http://textbelt.com/text")
      #Net::HTTP.post_form(uri, {
      #    :phone => '+237691451189',
      #    :message => 'Hello world',
      #    :key => 'e0cc5680081956c7d206955ddc96ae9f58ae53044H9HtTWAkm6ApR6MV285mFTT4',
      #})
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
    #ip = request.env['REMOTE_ADDR']
    #info = HTTParty.get("https://ipapi.co/#{ip}/json/")
    #puts "======= #{info} ========"
    quartier = params[:ville]
    #coordonnee = params[:coordonnees]
    lon = params[:lon]
    lat = params[:lat]
    description = params[:description]
    photo = params[:photo]
    type = params[:type]
    agent = params[:matricule]

     a = Alerte.new(agent_id: agent, type_id: type, longitude: Base64.decode64(lon), latitude: Base64.decode64(lat), description: description, ville_id: quartier, statu_id: 1, titre: Type.find(type).name)
    #a.alertes.attach(Base64.decode64(photo))
     if a.save
      render json: {
          status: :success,
          date: Date.today
      }
     else
      render json: {'errro': a.errors.messages}
     end
  end

  #get stored alertes on plateforme
  def read_alertes
    #on recupere les informations de l'agent au nombre de 3
    # #pener a ajouter les photos
    matricule = params[:matricule]
    ville   = params[:ville_id]

    #on verifie les informations
    read = Alerte.where(ville_id: ville).order(created_at: :desc)
    render json: {
        alerte: read
    }
  end
end
