class GestionAlerteController < ApplicationController

  #retourne toutes les alertes de ce jour
  def today
    @today = Alerte.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).order(created_at: :desc)
    render layout: 'admin'
  end

  def week
    @week = Alerte.where(created_at: 7.days.ago..Date.today).order(created_at: :desc)
    render layout: 'admin'
  end

  def mounth
    @mois = Alerte.where(created_at: 30.days.ago..Date.today).order(created_at: :desc)
    render layout: 'admin'
  end

  #Affiche touts les points sur une carte leafleft
  def cartography
    @cartography = Alerte.all
    render layout: 'admin'
  end

  def region
    @region = Alerte.all.order(created_at: :desc).order(ville_id: :desc).distinct

    #on affiche aussi toutes les villes disponible
    @ville = Alerte.all.distinct.pluck(:ville_id)
    render layout: 'admin'
  end

  def tri_ville
    @ville = Ville.find(params[:ville_id]).name
    @alerte = Alerte.where(ville_id: params[:ville_id]).order(created_at: :desc)
    render layout: 'admin'
  end
end
