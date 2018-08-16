class AccessController < ApplicationController
  #on verifie si l'utilisateur est connecter avant de donner acces aux ressource
  before_action :confirm_logged_in, only: [:login, :attemp_login, :admin, :logout]

  def index
  end

  def new
    @request = Fylo.new
  end

  def login
    render layout: 'login'
  end

  #pour la lecture des email 
  def email
    render layout: 'wemail'
    
  end

  #Administration de la plateforme
  #route /acces/admin
  #params:
  def admin
    render layout: 'admin'

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
        case found_user.service
          when "urgence"
            session[:service] = "urgence"
            redirect_to(action: 'request_service', id: 'fylo')
          when "developer"
            session[:service] = "admin"
            redirect_to(action: 'developer')
          when "admin"
            session[:service] = "admin"
            redirect_to(action: 'admin')
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
    session[:name] = nil
    redirect_to(action: 'login')
  end
  
  private
  def confirm_logged_in
    unless session[:name]
      #redirect_to(action: 'login')
      return false
    else
      return true
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def access_params
  #   params.require(:fylo).permit(:name, :prenom, :email)
  # end

end
