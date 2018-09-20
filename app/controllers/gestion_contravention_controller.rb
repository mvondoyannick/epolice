class GestionContraventionController < ApplicationController
  def today
    @today = Convocation.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).order(created_at: :desc)
    render layout: 'admin'
  end

  def week
    @week = Convocation.where(created_at: 7.days.ago..Date.today).order(created_at: :desc)
    render layout: 'admin'
  end

  def mounth
    @mois = Convocation.where(created_at: 30.days.ago..Date.today).order(created_at: :desc)
    render layout: 'admin'
  end

  def month_detail
    id = params[:convocation_id]
    @query = Convocation.find(id)
    render layout: 'admin'
  end

  def cartography
    render layout: 'admin'
  end

  def region
    render layout: 'admin'
  end

  #permet de gere la recherche par periode
  def periode
    @debut = params[:debut]
    @fin = params[:fin]
    @query = Alerte.where(created_at: params[:debut]..params[:fin]).order(created_at: :desc)
    render layout: 'admin'
  end

  def all
    @all = Convocation.order(created_at: :desc).all
  end
end
