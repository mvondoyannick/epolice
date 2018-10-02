class ParametreController < ApplicationController
  before_action :authenticate_admin!
  layout 'fylo'
  def index
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
  end
end
