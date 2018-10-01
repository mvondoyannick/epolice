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
end
