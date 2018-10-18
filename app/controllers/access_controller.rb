class AccessController < ApplicationController
  #on verifie si l'utilisateur est connecter avant de donner acces aux ressource
  #before_action :confirm_logged_in, only: [:login, :attemp_login, :admin, :logout]
  before_action :authenticate_admin!, except: [:login, :serviceShow]


  def index
  end

  def new
    @request = Fylo.new
  end

  def login
    #render layout: 'login'
    # vue de connexion principale
    render layout: 'template/login2'
  end

  def login2
  render layout: 'template/login2'
  end

  #les services de la plateforme
  def serviceShow
    render layout: 'template/login2'
  end
  # fin des services

  #pour la lecture des email 
  def email
    render layout: 'wemail'
    
  end

  #Administration de la plateforme
  #route /acces/admin
  #params:
  def admin
    @top_infraction = Convocation.distinct.pluck(:infraction_id)
    @top_alerte = Alerte.distinct.pluck(:type_id)
    render layout: 'fylo'
    #render layout: 'admin'
  end


  #apropos
  #route /access/request/about
  #params
  def about
    
  end
  #Documentation de la plateforme
  #route /acces/request/docs
  #params
  def request_doc
    
  end

  #permet une administration totale
  def access_control
    
  end
  

  #Demander un compte à la DGSN
  #route /access/request/account
  #params:
  def request_account
    @request = Fylo.new(params[:name])

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Alerte was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render controller: "access", action: "login" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def request_service
    @alert = Alerte.all
    render layout: 'other'

  end

  def attemp_account
    if params[:service].present? && params[:nom].present? && params[:prenom].present? && params[:matricule].present? && params[:phone].present? && params[:email].present? && params[:_pwd].present? && params[:pwd_confirme].present?
      #on considere que tout est ok
      redirect_to(action: 'login')
    else
      flash[:notice] = "Certains champs semblent etre vides"
      print "Certains champs semblent etre vides #{params}"
    end
  end

  #permet de generer un fichier PDF
  def read
    
  end

  #voir toutes les alertes
  def alerte_all
    @alerte = Alerte.all
    render layout: 'admin'
  end

  #voir toutes les convocations
  def convocation_all
    @convocation = Convocation.all
    render layout: 'admin'
  end

  def attemp_login
    if params[:matricule].present? && params[:pwd].present?
      found_user = Fylo.where(matricule: params[:matricule]).first
      if found_user && found_user.password == params[:pwd]
        print "tout est ok"
        print "=============== utilisateur trouvé ============"
        session[:name] = found_user.name
        session[:id] = found_user.id
        session[:lastConnection] = found_user.lastConnected
        flash[:notice] = "#{session[:name]} vous etes connecté"
        case current_user.role.name #found_user.service
          when "urgence"
            session[:role] = "urgence"
            redirect_to(action: 'request_service', id: 'fylo')
          when "developer"
            session[:role] = "admin"
            redirect_to(action: 'developer')
          when "admin"
            session[:role] = current_user.role.name
            redirect_to(action: 'admin')
          when "superAdmin"
            session[:role] = current_user.role.name
            redirect_to "/access/admin"
          when "administrateur"
            session[:role] = current_user.role.name
            redirect_to access_a_l_administration_path
            #redirect_to action: administration
          when "camwater"
            session[:role] = current_user.role.name
            redirect_to(action: 'request_service') 
        end
      else
        print "======== utilisateur inconnu ========="
        flash[:notice] = "Impossible de vous identifier"
        redirect_to root_path
      end
    else
      flash[:notice] = "Une information semble etre incomplete"
      redirect_to root_path
    end
    
  end

  def logout
    session[:role] = nil
    print "======= #{session[:role].inspect} ========="
    redirect_to(action: 'login')
  end

  #=========== pour les partenaires ==============
  def partenaires
    render layout: 'admin'
  end

  #pour le paiement dans l'administration camerounaise
  def administration
    render layout: 'administration'
  end

  #pour la recherche des documents
  def search_document
    query = params[:input]
    type = params[:type]
    case type
      when "cni"
        @title = "Recherche suivant "+type
        @query = Convocation.where(cni: query).uniq
      when "immatriculation"
        @query = Convocation.where(immatriculation: query).uniq
      when "telephone"
        @title = "Recherche suivant "+type
        @query = Convocation.where(phone: query, status: "impaye").order(created_at: :desc).order(cni: :desc)
        #@cni = Convocation 
        #redirect_to action: self, id: "#{type}/#{query}"
      when "code"
        @query = Convocation.where(code: query).uniq
    end
    render layout: 'administration'
  end

  def search_cni
    cni = params[:cni]
    @query = Convocation.where(cni: cni)
    render layout: 'administration'
  end

  #lesture d'un document de contravention
  def read_document
    #puts "======= #{params[:controller]} ========"
    #on pars chercher le contenu du params
    @query = Convocation.find(params[:contravention_id])
    render layout: 'administration'
  end

  #permet de payer une contravention
  def buy_document
    #confirm paiement

    #recherche de l'enregistrement dans la BD
    pay = Convocation.find(params[:id])

    #debut de la mise a jour
    pay.status = "paye"
    #s = pay.save
    #verification
    if pay.save
      puts "====== c'est bon, on a update ========"
      flash[:notice] = "A Paiement effectué"
      redirect_to action: "/access/a/l/administration"
    else
      puts "========= error ========="
      #redirect_to action: 'administration', notice: "Impossible d effectuer le paiement : #{s.errors.messages}"
    end
    render layout: 'administration'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def access_params
  #   params.require(:fylo).permit(:name, :prenom, :email)
  # end
  #

  def attemp_buying

  end

  #gestion des partenaires
  def partner
    render layout: 'fylo'
  end

  #detail sur les partenaires
  def partner_detail
    if params[:jeton] == 'grvpc'
      @query = Grvpc.find_by(id: params[:id])
    elsif params[:jeton] == 'metropolis'
      @query = Metropoli.find_by(id: params[:id])
    elsif params[:jeton] == 'member'
      @query = Member.find_by(id: params[:id])
    end
    render layout: 'fylo'
  end

  #for test
  def open

  end

  def application
    render layout: 'fylo'
  end

  def systeme
    render layout: 'fylo'
  end

  #module de gestion des langues
  def lange
    @langue = Langue.new
    render layout: 'fylo'
  end

  def paiement

  end

  #importation des parametres
  def importation
    file = params[:file]
    Alerte.import(file)
    flash[:notice] = "Fichier #{file} importé avec succes"
    render layout: 'fylo'
  end

  #exportation des documents
  def exportation
    render layout: 'fylo'
  end

  def tested
    respond_to do |format|
      format.html do
        Alerte.all
        render layout: 'fylo'
      end
      format.xls
      format.csv {send_data Alerte.all.to_csv}
      format.xls
    end
  end

  #pour les parametres de la table selectionnée
  def export_detail
    puts params[:table]
    redirect_to controller: :access, action: "#{params[:table]}", data: params[:table]
  end

  def constat
    render layout: 'fylo'
  end

  def convocation
    render layout: 'fylo'
  end

  def alerte
    render layout: 'fylo'
  end

  #configuration des inportation-exportation
  def setup_import_export
    render layout: 'fylo'
  end

  #ajout des utilisateur administrateurs
  def admin_show
    @user = Admin.all
    render layout: 'fylo'
  end


  #ajout despartenaires
  def member_show
    @user = Member.all
    render layout: 'fylo'
  end

  #enregistrement d'un nouveau partenaire
  def member_new
    @member = Member.new

    #retriving datas
    member = Member.new(email: params[:email], password: params[:password], matricule: SecureRandom.hex(10).upcase, service_id: params[:service_id], phone: params[:phone], region_id: params[:region_id])
    if member.save
      flash[:notice] = "Membre ajouter avec succes"
      redirect_to action: member_new
    else
      flash[:notice] = "Impossible d'enregistrer un partenaire: #{member.errors.messages}"
      puts "====== #{member.errors.messages} ======="
    end
    render layout: 'fylo'
  end

  def admin_new

  end

  #ajout du personnel de metropolis
  def metropolis_show
    @user = Metropoli.all
    render layout: 'fylo'
  end

  #ajout des assurances
  def assurance_show
    @user = Assurance.all
    render layout: 'fylo'
  end

  #pour la gestion de l'aide sur l'application
  def yelp
    render layout: 'fylo'
  end


end
