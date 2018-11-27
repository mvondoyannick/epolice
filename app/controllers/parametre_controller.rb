class ParametreController < ApplicationController
  before_action :authenticate_admin!
  #layout 'fylo'
  #render 'layouts/views/index'
  add_breadcrumb "Fichiers", :parametre_index_path


  def index
    render layout: 'views/index'
  end

  def gestion_sturcture_partenaire
    render layout: 'views/index'
  end

  def localisation
    add_breadcrumb "découpage administratif", :parametre_localisation_path
    render layout: 'views/index'
  end

  def region
    render layout: 'views/index'
  end

  def departement
    render layout: 'views/index'
  end

  def arrondissement
    render layout: 'views/index'
  end

  def admin
    @admin = Admin.all
    #pour afficher les administrateurs de la plateforme

    @grvpc = Grvpc.all

    @member = Member.all

    @metropolis = Metropoli.all

    @agent = Agent.all
    add_breadcrumb "utilisateurs", :parametre_admin_path
    render layout: 'views/index'
  end


  def phone_user
    @agent = Agent.all
    add_breadcrumb "utilisateur", :parametre_localisation_path
    render layout: 'views/index'
  end

  def add_user
    render layout: 'views/index'
  end

  #pour la gestion des GRVPC
  def grvpc
    render layout: 'views/index'
  end

  def bulletin_patrouille
    #render layout: 'fylo'
    render layout: 'views/index'
  end
end
