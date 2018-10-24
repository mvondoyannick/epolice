class Api::ConvocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:new_alerte]
  require 'net/http'
  require 'uri'
  require 'httparty'
  require 'base64'

  #autoriser les connexion en https
  #HTTParty::Basement.default_options.update(verify: false)

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
        message: token.map do |data|
          {
              region: data.region.name,
              region_id: data.region_id,
              grade: data.grade.name,
              grade_id: data.grade_id,
              unite: data.unite.name,
              unite_id: data.unite_id,
              apikey: SecureRandom.hex(10),
              cookies: {
                  value: SecureRandom.hex(10),
                  expires: 1.hour.from_now
              }
          }
        end
        #message: token,
        #region: token[0].region.name,
        #region_id: token[0].region_id,
        #grade: token[0].grade.name,
        #grade_id: token[0].grade_id,
        #unite: token[0].unite.name,
        #unite_id: token[0].unite_id,
        #data: rails_blob_path(Agent.avatar, disposition: "attachment", only_path: true),
        #affectation: Affectation.find(5).fin.to_date >= Date.today.to_date, #a mettre a jour de facon dynamique
        #image: '',
        #apikey: SecureRandom.hex(10),
        #code: 200,
        #cookies:  {value: SecureRandom.hex(10), expires: 1.hour.from_now }
      }
    end
  end

  #permet de verifier le token
  def verify_token
    matricule = params[:matricule]

    #on recherche l'ID

    #ensuite on recherche son token egt le status de ce token
  end

  #permet de verifier une contravention
  def verifyContravention
    code = params[:code]
    @p = Convocation.find_by_code(code.upcase)
    if @p.nil?
      render json: {
        status: :not_found,
        message: "code inconnu"
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

    #il faudra verifier si l'utilisateur et son téléphone sont authorisé et sont programmés

    a = Convocation.new(cni: params[:cni], phone: params[:phone], infraction_id: params[:motif], pieceretenu_id: params[:pieceretenue], agent_id: params[:agent], immatriculation: params[:immatriculation], status: "impayé")
    if a.save
      #message = "Le numero de telephone #{a.phone} ou le code #{a.code} est verbalise pour le(s) motif(s) ci-apres : #{a.infraction.motif}. Le montant de l amende est de : #{a.infraction.montant} F CFA."
      #HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{a.phone}&message=#{message}")
      #c'est ok, on envoi le SMS
        render json: {
            status: :save,
            message: :created
        }
    else
      render json: {
        status: :unprocessable_entity,
        message: a.errors,
        data: a.errors.messages
      }.to_json    
    end
  end

  def archive_generate_qr
    phone = params[:phone]
    matricule = params[:matricule]

    #recherche et verification de l'agent
    @agent = Agent.where(matricule: matricule, phone: phone).first
    if @agent
      con = Convocation.where(agent_id: @agent.id).where('pieceretenu_id > 0').where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
      #affectation = Affectation.where(agent_id: @agent.id).where('fin >= ?', Date.today).last
      render json: {
        status: 'success',
        data: con.map do |p|
          {
              id: p.id,
              date: p.created_at,
              piece: p.pieceretenu.name,
              motif: p.infraction.motif
          }
        end
      }
    end
  end

  #GET ALERTS 
  #permet de creer une nouvelle alerte
  def new_alerte
    #ip = request.env['REMOTE_ADDR']
    #info = HTTParty.get("https://ipapi.co/#{ip}/json/")
    #puts "======= #{info} ========"
    #quartier = params[:ville]
    #coordonnee = params[:coordonnees]
    #lon = params[:lon]
    #lat = params[:lat]
    #description = params[:description]
    #photo = Base64.decode64(params[:photo])
    #type = params[:type]
    #agent = params[:matricule]

    #gestion des photos avec activeRecord


     #a = Alerte.new(agent_id: agent, type_id: type, longitude: lon.to_s, latitude: lat.to_s, description: description, ville_id: quartier, statu_id: 1, titre: Type.find(type).name)

    @alerte = Alerte.new(alerte_params)


    status = @alerte.alertes.attach(params[:alertes])
    puts "======= #{status} ======="
    #recherche des autorisations
    today = Date.today
    #authorization = Affectation.where(agent_id: Agent.find(2).id).where("#{today} between #{Affectation.where(agent_id: 2).debut} and #{Affectation.where(agent_id: 2).fin}")
    #puts "========== #{authorization} =========="
     if @alerte.save
       #message = "Le numero #{a.phone} est verbalisee pour #{a.infraction.motif}, cout: #{a.infraction.montant}"
       #m = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{a.phone}&message=#{message}")
      render json: {
          status: :success,
          date: Date.today
      }
     else
      render json: {'errro': @alerte.errors.messages}
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

  #nouveau constat
  def new_constat
    query = Constat.new(
       name1: params[:name1],
       phone1: params[:phone1],
       cni1: params[:cni1],
       immatriculation1: params[:immatriculation1],
       marque1: params[:marque1],
       police1: params[:police1],
       name2: params[:name2],
       phone2: params[:phone2],
       cni2: params[:cni2],
       immatriculation2: params[:immatriculation2],
       marque2: params[:marque2],
       police2: params[:police2],
       typeaccident_id: params[:typeaccident],
       lieu: params[:lieu],
       agent_id: params[:agent],
       comment: params[:comment],
       latitude: params[:latitude],
       longitude: params[:longitude]
    )
    if query.save
      render json: {
          status: :accepte
      }
    else
        render json: {
        status: :rejete
      }
    end
  end

  #rechercher une piece
  def search_document
    code = params[:code]
    query = Convocation.find_by_code(code)
    if query.nil?
      render json: {
          status: :error,
          buy: :error,
          message: 'Ce code est inexistant'
      }
      elsif (query.buy).nil?
        render json: {
            status: :buy_befor_check,
            buy: :no,
            message: 'Merci de payer votre contravention'
        }
      elsif !(query.buy).nil?
        render json: {
            status: :ok,
            buy: :yes,
            message: query.agent.phone,
            commissariat: query.agent.commissariat.name
        }
    end
  end

  #data who comme from ussd data plateform
  def ussd_data
    data = params[:data]

    #on fait le decoupage de la chaine de caractere suivant le caractere de delimitation
    splited = data.split('@')
    render plain: "Voici les données #{splited}" if !splited.nil?
  end

  private

    def alerte_params
      params.permit(:titre, :description, :date, :type_id, :agent_id, :action, :lieu, :statu_id, :longitude, :latitude, :alertes, :ville_id)
    end
end
