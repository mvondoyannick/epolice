class StatistiqueController < ApplicationController
  def index
    render layout: 'admin'
  end

  def day
  end

  def week
  end

  def mois
  end

  def agent
    #vue sur les agents
  end

  def alerte

  end

  def contravention

  end

  def constat

  end

  def statistique_home
    #on recupere l'url courante
    url = request.original_url
    puts " ==== #{url} ==== "
  end
  
end
