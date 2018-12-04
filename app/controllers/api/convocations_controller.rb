class Api::ConvocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:new_alerte, :authenticate]
  require 'net/http'
  require 'uri'
  require 'httparty'
  require 'base64'
  #require 'carrierwave/orm/activerecord'
  require 'json'

  #autoriser les connexion en https sans authentifcation https
  HTTParty::Basement.default_options.update(verify: false)

  #authentification d'un agent sur la plateforme
  # @route: GET
  # @!method: HTTP GET
  # @param: phone::integer, matricule::string
  # @return: JSON tree of authenticated agent on plateform
  # @developer: mailto:mvondoyannick@gmail.com
  def authUser
    phone = params[:phone]
    matricule = params[:matricule].to_s

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
            name: data.complete_name,
            id: data.id,
            #region: data.region.name,
            #region_id: data.region_id,
            #grade: data.grade.name,
            #grade_id: data.grade_id,
            #unite: data.unite.name,
            #unite_id: data.unite_id,
            avatar: URI.join('http://192.168.1.245:3000/', data.avatar.url),
            unite: Groupement.find(data.groupement_id).name.split[0],
            unite_id: data.groupement_id,
            #region: Groupement.find(data.groupement_id).name.split[1],
            region_id: data.region_id,
            region: data.region.name || nil,
            arrondissements: Arrondissement.where(region_id: data.region_id).map do |arrondissement|
              {
                arrondissement_id: arrondissement.id,
                arrondissement_name: arrondissement.name
              }
            end,
            #unite: data.groupement.split[0],
            #region: data.groupement.split[1],
            #region2: data.region.name,
            # TODO revoir le probleme de la geolocalisation par IP avec HTTParty
            #ip_geolocation: HTTParty.get('https://ipapi.co/'+request.remote_ip+'/json/'),
            #JSON.parse(Net::HTTP.get(URI('https://ipapi.co/'+request.remote_ip+'/json/'))),
            apikey: SecureRandom.hex(10),
            cookies: {
                value: SecureRandom.hex(10),
                expires: 72.hour.from_now,
                cookies_status: 1.hour.from_now > DateTime.now
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

  #permet de verifier le token d'un agent
  # @route: GET
  # @params: matricule, as string
  # @developer: mailto:mvondoyannick@gmail.com
  # @detail:
  def verify_token
    matricule = params[:matricule]

    #on recherche l'ID de cette agent
    @agent = Agent.find(matricule)

    #ensuite on recherche son token egt le status de ce token
    if !@agent.tokenagent.nil?
      if @agent.expire > DateTime.now
        #si son token est encore a jour
        render json: {
            status: :success,
            token: @agent.tokenagent,
            expire: @agent.expire
        }
      else
        #dans ce cas son token n'est plus a jour, on le remet à jour
        current_agent = Agent.where(matricule: matricule).first
        current_agent.tokenagent  = SecureRandom.hex(3)
        current_agent.expire      = 45.minute.from_now
        #on fait persister les données
        if current_agent.save
          render json: {
              message: :updated
          }
        else
          puts "==== #{current_agent.errors.messages}"
        end
      end
    else #
      render json: {
          status: :not_found,
          message: 'Pas de token trouvé'
      }
    end

  end

  #permet de verifier une contravention
  # @route: api/epolice/verify/contravention/cni
  # @params: cni, as string
  # @detail:
  # @result: JSON tree
  # developer: mailto:mvondoyannick@gmail.com
  def verify_contravention
    data = params[:cni].html_safe
    query = Convocation.where(cni: data)
    render json: {
        result: query.map do |data|
          {
              contravention_id: data.id,
              created_at: data.created_at,
              expire_until: data.created_at+72.hours,
              is_valid: (Date.today > data.created_at+72.hours),
              phone: data.phone,
              cni: data.cni,
              immatriculation: data.immatriculation,
              infraction_id: data.infraction_id,
              infraction_name: data.infraction.motif,
              infraction_amount: data.infraction.montant,
              pieceretenu_id: data.pieceretenu_id,
              pieceretenu_name: data.pieceretenu.name,
              request_id: request.request_id
          }
        end
    }
  end

  #verification du token via le canal USSD
  def ussd_token_verify

  end

  #permet de verifier une contravention
  def verifyContravention
    code = params[:code]
    lang = params[:lang]

    # pour la langue 1 = Francais, 2 = Anglais
    #condition de la langue
    @p = Convocation.where(phone: code, status: 'impayé').last
    if @p.nil?
      render plain: "Le numéro #{code} n'est lié à aucune contravention. Merci"
    else
      render plain: "Le numéro de téléphone  #{code} : le montant de l'amende à payer est de #{@p.infraction.montant} FCFA pour une l'infraction #{@p.infraction.motif}"
    end
  end

  #perme de verifier une contravention provenant du mobile
  def verifyContraventionFromMobile
    cni = params[:cni]

    query = Convocation.where(cni: cni, status: '0').last
    if query.nil?
      render json: {
          status: :false,
          message: "La CNI #{cni} n'est liée à aucune contravention. merci"
      }
    else
      render json: {
          status: :true,
          data: query
      }
    end
  end

  #recherche d'une contravention pour paiement
  def search_paiement_contravention

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

    #introcduction de la photo


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

    #on joint la photo
    query.photo = params[:photo]

    #on enregistre les données

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
    region = params[:region_id]
    render json: {
      types: Type.all,
      arrondissement: Arrondissement.where(region_id: region).map do |arrondissement|
        {
          arrondissement_id: arrondissement.id,
          arrondissement_name: arrondissement.name
        }
      end
    }
  end

  #retourne tous les types d'infractions
  def api_infraction
    render json: {
        infractions: Infraction.all
    }
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

    #a = Convocation.new(cni: params[:cni], phone: params[:phone], infraction_id: params[:motif], pieceretenu_id: params[:pieceretenue], agent_id: params[:agent], immatriculation: params[:immatriculation], status: "impayé")
    a = Convocation.new(infraction_params)
    if a.save
      #message = "Le numero de telephone #{a.phone} ou le code #{a.code} est verbalise pour le(s) motif(s) ci-apres : #{a.infraction.motif}. Le montant de l amende est de : #{a.infraction.montant} F CFA."
      #HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{a.phone}&message=#{message}")
      #c'est ok, on envoi le SMS
        render json: {
            status: :save,
            message: :created,
            is_paiement_set?: Modepaiement.where(status: 1).count,
            modepaiement: Modepaiement.where(status: 1).map do |d|
              {
                  data: d.name
              }
            end
        }
    else
      render json: {
        status: :unprocessable_entity,
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
  # @developer: mailto:mvondoyannick@gmail.com
  def new_alerte

    #recuperation des parametres
    #agent_id = params[:agent_id]
    #type_id = params[:type_id]
    #longitude = params[:longitude]
    #latitude = params[:latitude]
    #description = params[:description]
    #statu_id = params[:statu_id]
    #titre = Type.find(params[:type_id]).name
    #:agent_id, :type_id, :longitude, :latitude, :description, :statu_id, :titre, :photo


     #@alerte = Alerte.new(agent_id: agent_id, type_id: type_id, longitude: longitude, latitude: latitude, description: description, statu_id: statu_id, titre: titre, photo: photo)

    @alerte = Alerte.new(alert_params)

    #@alerte.photo.attach(alert_params[:photo]) #on persiste les données
    # with carriewave
    #@alerte.photo = params[:photo]
    if @alerte.save
      p = Type.find(@alerte.type_id).entity
      a = JSON.parse p
      b = a.reject(&:empty?)
      w = []
      query = b.each {|content| w.push(Structure.find(content).name)}
      puts b
      puts @alerte.photo.url
      render json: {
          status: :created,
          partner: w, #on retourne un tableau contenant les partenaires,
          ip: request.remote_ip,
          #ip_geolocation: JSON.parse(Net::HTTP.get(URI('https://ipapi.co/'+request.remote_ip+'/json/'))),
          session: request.reset_session,
          photo: @alerte.photo.url,
          photo_identifier: @alerte.photo_identifier
      }

      #ensuite on emet la notification
      OneSignals::new_alerte(@alerte.description.truncate(20), @alerte.id)

    else
      render json: {
          status: :failed,
          message: @alerte.errors.messages}
    end

    #on enregistre l'information dans la base de données



    #status = @alerte.alertes.attach(params[:alertes])
    #puts "======= #{status} ======="
    #recherche des autorisations
    #today = Date.today
    #authorization = Affectation.where(agent_id: Agent.find(2).id).where("#{today} between #{Affectation.where(agent_id: 2).debut} and #{Affectation.where(agent_id: 2).fin}")
    #puts "========== #{authorization} =========="
     #if @alerte.save
       #message = "Le numero #{a.phone} est verbalisee pour #{a.infraction.motif}, cout: #{a.infraction.montant}"
       #m = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{a.phone}&message=#{message}")
      #render json: {
          #status: :success,
          #date: Date.today
      #}
     #else
      #render json: {'errro': @alerte.errors.messages}
     #end
  end

  #get stored alertes on plateforme
  def read_alertes
    #on recupere les informations de l'agent au nombre de 3
    # #pener a ajouter les photos
    matricule = params[:matricule]
    ville   = params[:ville_id] #attention, ceci concerne la region

    #on verifie les informations
    # TODO conditionner l'affichage des alertes en fontions du statut non_resolu
    read = Alerte.where(region_id: ville).where(statu_id: 2).order(created_at: :desc).first(5)
    tab = []
    render json: {
        alerte: read.map do |data|
          {
              action: data.action,
              arrondissement: Arrondissement.find(data.arrondissement_id).name,
              date: data.created_at,
              region: Region.find(data.region_id).name,
              description: data.description,
              titre: Type.find(data.titre).name,
              statut: Statu.find(data.statu_id).name,
              image: URI.join('http://192.168.1.245:3000/assets/logo_mobile.png'),
              partenaire_id: JSON.parse(Type.find(data.type_id).entity).reject(&:empty?).each {|content| tab.push(Structure.find(content).name)},
              partenaire: tab.uniq

          }
        end
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

  #rechercher une piece dans le cadre de l'argchivage
  # detail:
  # route: GET api/document/find/:code
  # method GET
  # developer: mailto:mvondoyannick@gmail.com
  def search_document
    #code = params[:code]
    code = params[:code] #code ici represente le numéro de telephone avec lequel on desire effectuer une recherhce

    #on recherche dans la table
    convocation = Convocation.where(phone: code).last
    if convocation
      query = Transfert.where(convocation_id: convocation.id)
      #query = Convocation.find_by_code(code)
      if query
        render json: {
            message: :found,
            result: query.map do |data|
              {
                date: data.created_at,
                agent: Agent.find(data.agent_id).complete_name,
                date_convocation: Convocation.find(data.convocation_id).created_at,
                lieu: Agent.find(data.agent_id).commissariat.name,
                piece: Convocation.find(data.convocation_id).pieceretenu.name
              }
            end
        }
      else
        render json: {
            message: :not_found,
            result: query
        }
      end
    else
      render json: {
          message: :not_found
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

  #permet de verifier la programmation d'un agent, l'affectation
  def set_affectation
    matricule = params[:matricule]

    #on recherche l'agent
    @agent = Agent.find(matricule).id

    if @agent
      #rechercher l'affectation de cet agent
      @affectation = Affectation.where(agent_id: @agent).where('fin >= ?', Date.today).last

      if @affectation
        render json: {
          data:
            {
              token: @affectation.token,
              affectation_status: @affectation.fin >= DateTime.now,
              expire_at: @affectation.fin,
              commissariat: @affectation.commissariat.name,
              postepolice: @affectation.postepolice.name,
              localisation: @affectation.localisation
            }
        }
      else
        render json: {
          data:
            {
              token: nil,
              affectation_status: false,
              status: :no_data_found,
              message: 'Aucune affectation trouvée'
            }
        }
      end
    else
      render json: {
          status: :not_found,
          message: 'Aucun agent trouvé',
          code: '404'
      }
    end
  end

  #permet de verifier si un contrevenant a deja été verbalisé
  def verif_contrevenant_verbalise
    @cni = params[:cni].html_safe

    #recherche contravention de la cni
    @query = Convocation.where(cni: @cni).where(status: 'Impayé').last
    if @query
      query = @query.created_at+3.day
      #retourner le resultat
      if query
        render json: {
          datas:
            {
              message: 'Contraventions impayées, en cours',
              code: token,
              infraction: infraction.name
            }
        }
      else
        render json:
         {
             message: 'aucune contravention',
             code: nil,
             infraction: nil
         }
      end
    else
      render json: {
          message: :rien
      }
    end

  end

  #gestion de la decharge
  # @detail : permet de gerer la decharge d'un document sur la base d'un N° de CNI et de la photo
  # @routes:
  # @verb : http post, http options
  # @params : CNI=>string, photo=>file_uri
  # @format result : JSON
  # @developer : mvondoyannick@gmail.com
  def decharge
    cni = params[:cni].to_string.html_safe
    photo = params[:photo]
    piece = params[:piece_name]
    agent = params[:agent_id]
    cni = params[:cni] #retourne la derniere contravention ayant le status payee | 1

    query = Convocation.where(agent_id: agent, cni: cni, pieceretenu_id: piece)

    render json: query

    #on recherche les information
    #SearchDecharge.new(cni)

  end

  #debut de l'archivage
  # detail: debut du processus d'archivage
  # route: GET epolice/trasmission/start/:phone
  # params: phone: string
  # developer: mailto:mvondoyannick@gmail.com
  # status: stagind
  def startArchivage
    $phone = params[:phone]
    query = MToM.new($phone)
    render json: query.getConvocation
  end

  #reception des données durant le processus d'archivage
  def receiveData
    datas = params[:data]

    #appel du module
    query = MToM.new($phone)
    data = datas.split(',')
    # on recupere l'ID de l'agent
    agent_id = query.getAgentData
    #on recupere le code
    code = query.getCode
    # on cree le transfert
    data.each {|content| Transfert.create agent_id: agent_id.id, convocation_id: content.to_i, status: "0", code: query.getCode, status_code: 'waiting', expire_in: 5.minutes.from_now}
    #query = Transfert.new(agent_id: agentData.id, convocation_id: userConvocation.id)
    render json: {
        data: code
    }
  end

  #fin de l'archivage
  def endArchivage
    data = params[:code]
    process = MToM.new($phone)
    d = process.finalize(params[:phone], data)
    puts d
    if d == 'success'
      render json: {
          message: :validate
      }
    else
      render json: {
          message: :failed,
          reason: 'Incompatible phone or code'
      }
    end
  end


  private
    def no_sens

    end

    def decharge_params
      params.permit(:cni, :photo)
    end

    def alerte_params
      params.permit(:titre, :description, :date, :type_id, :agent_id, :action, :lieu, :statu_id, :longitude, :latitude, :alertes, :ville_id)
    end

    def alert_params
      params.permit(:agent_id, :type_id, :longitude, :latitude, :description, :statu_id, :titre, :photo, :region_id, :lieudit, :arrondissement_id)
    end

    def infraction_params
      params.permit(:infraction_id, :pieceretenu_id, :agent_id, :phone, :cni, :immatriculation)
    end
end
