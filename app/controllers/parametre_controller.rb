class ParametreController < ApplicationController
  before_action :authenticate_admin!
  layout 'fylo'
  add_breadcrumb "home", :parametre_index_path

  def index

    add_breadcrumb "index", root_path
  end

  def gestion_sturcture_partenaire

  end

  def localisation
    add_breadcrumb "localisation", :parametre_localisation_path
  end

  def region

  end

  def departement

  end

  def arrondissement

  end

  def admin
    @admin = Admin.all
    #pour afficher les administrateurs de la plateforme

    @grvpc = Grvpc.all

    @member = Member.all

    @metropolis = Metropoli.all

    @agent = Agent.all
  end


  def phone_user
    @agent = Agent.all
  end

  def add_user
    
  end

  #pour la gestion des GRVPC
  def grvpc

  end

  def bulletin_patrouille
    render layout: 'fylo'
  end
end
