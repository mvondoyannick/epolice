class ParametreController < ApplicationController
  before_action :authenticate_admin!
  layout 'fylo'

  def index

  end

  def gestion_sturcture_partenaire

  end

  def localisation

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

  def add_user
    
  end

  #pour la gestion des GRVPC
  def grvpc

  end

  def bulletin_patrouille
    render layout: 'fylo'
  end
end
