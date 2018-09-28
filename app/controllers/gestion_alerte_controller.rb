class GestionAlerteController < ApplicationController

  #retourne toutes les alertes de ce jour
  def today
    @today = Alerte.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).order(created_at: :desc).all
    #@today = Alerte.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day, ville_id: Agent.find(session[:id]).ville_id).order(created_at: :desc).all
    render layout: 'fylo'
  end

  def week
    @week = Alerte.where(created_at: 7.days.ago..Date.tomorrow).order(created_at: :desc)
    render layout: 'fylo'
  end

  def mounth
    @mois = Alerte.where(created_at: 30.days.ago..Date.tomorrow).order(created_at: :desc)
    render layout: 'fylo'
  end

  #Affiche touts les points sur une carte leafleft
  def cartography
    if params[:id].nil
      id = params[:id].to_i #contient la date de debut
      @cartography = Alerte.where(created_at: id.days.ago..Date.today).order(created_at: :desc)
    else
      id = params[:id].to_i #contient la date de debut
      @cartography = Alerte.where(created_at: id.days.ago..Date.today).order(created_at: :desc)
      #@cartography = Alerte.where(created_at: id.days.ago..Date.today, ville_id: Agent.find(session[:id]).ville_id).order(created_at: :desc)
    end
    
    render layout: 'fylo'
  end

  def region
    @region = Alerte.all.order(created_at: :desc).order(ville_id: :desc).distinct

    #on affiche aussi toutes les villes disponible
    @ville = Alerte.all.distinct.pluck(:ville_id)
    render layout: 'fylo'
  end

  def tri_ville
    @ville = Ville.find(params[:ville_id]).name
    @alerte = Alerte.where(ville_id: params[:ville_id]).order(created_at: :desc)
    render layout: 'fylo'
  end

  #permet de gere la recherche par periode
  def periode
    @debut = params[:debut]
    @fin = params[:fin]
    @query = Alerte.where(created_at: params[:debut]..params[:fin]).order(created_at: :desc)
    render layout: 'fylo'
  end

  def carte
    data = params
    puts "========= #{data} ============="
    redirect_to action: 'cartography', id: data
  end

  def time_machine
  end

  #pour les alerte resolues
  def resolve
    @query = Alerte.where(statu_id: 1).order(created_at: :desc)
    render layout: 'fylo'
  end

  #pour les alertes non resolues
  def unresolve
    @query = Alerte.where(statu_id: 2).order(created_at: :desc)
    render layout: 'fylo'
  end

  def archive
    id = params[:alerte_id]
    query = Alerte.find(id)
    query.archive = "archived"
    if query.save
      redirect_to(:back)
    else
      flash[:notice] = "Impossible d'archiver"
    end
  end

  def all
    
  end
end
