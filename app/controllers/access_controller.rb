class AccessController < ApplicationController
  #on verifie si l'utilisateur est connecter avant de donner acces aux ressource
  before_action :confirm_logged_in, only: [:login, :attemp_login, :admin, :logout]

  def index
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
        flash[:notice] = "vous etes connecté"
        case found_user.service
          when "urgence"
            redirect_to(action: 'urgence')
          when "developer"
            redirect_to(action: 'developer')
          when "admin"
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

end
