class AccessController < ApplicationController
  #on verifie si l'utilisateur est connecter avant de donner acces aux ressource
  #before_action :confirm_logged_in, only: [:login, :attemp_login, :admin, :logout]


  def index
  end

  def new
    @request = Fylo.new
  end

  def login
    if !session[:role].nil?
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
        when "administrateur"
          session[:role] = current_user.role.name
          redirect_to(action: 'administrateur')
        when "eneo" || "camwater" || "camtel"
          session[:role] = current_user.role.name
          redirect_to(action: 'request_service') 
      end
    else
      render layout: 'login'
    end
  end

  #pour la lecture des email 
  def email
    render layout: 'wemail'
    
  end

  #Administration de la plateforme
  #route /acces/admin
  #params:
  def admin
    if control? #si et seulement si c'est un administrateur
      render layout: 'admin'
    else
      session[:role] = nil #on vide la session parce qu'il a essayé de frauder
      redirect_to action: 'login', notice: 'Vous n\' este pas authorisé'
    end

    #les 10 dernieres alertes
    #@alerte_tmp = Alerte.all.limit(10)

    #nombre total d'agent existant dans la base de données
    #@agent = Agent.count 

    #nombre d'alertes totales
    #@alert = Alerte.count
    #authorize! :read, Access
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
    render layout: 'other'
    @alert = Alerte.all
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
    if params[:email].present? && params[:pwd].present?
      found_user = Fylo.where(email: params[:email]).first
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
          when "administrateur"
            session[:role] = current_user.role.name
            redirect_to(access_a_l_administration_url)
          when "eneo" || "camwater" || "camtel"
            session[:role] = current_user.role.name
            redirect_to(action: 'request_service') 
        end
      else
        print "======== utilisateur inconnu ========="
      end
    else
      flash[:notice] = "Entrer une information"
      redirect_to(action: 'login')
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
        @query = Convocation.where(phone: query, status: "impaye").order(created_at: :desc)
        #redirect_to action: self, id: "#{type}/#{query}"
      when "code"
        @query = Convocation.where(code: query).uniq
    end
    render layout: 'administration'
  end

  #lesture d'un document de contravention
  def read_document
    #puts "======= #{params[:controller]} ========"
    #on pars chercher le contenu du params
    @query = Convocation.find(params[:contravention_id])
    respond_to do |format|
      format.html
      #format.json query
      format.pdf do |pdf|
        #possibilité de rendre le document au format pdf
        pdfs = Prawn::Document.new

      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def access_params
  #   params.require(:fylo).permit(:name, :prenom, :email)
  # end

end
