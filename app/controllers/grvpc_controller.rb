class GrvpcController < ApplicationController
  #before_action :authenticate_grvpc!, only: [:index]
  add_breadcrumb "Dashboard", :grvpc_index_path
  layout 'grvpc/grvpc'

  def index
    @alerte = Alerte.order(created_at: :desc).limit(10)
    @contravention = Convocation.order(created_at: :desc).limit(10)
    @constat = Constat.order(created_at: :desc).limit(10)
    #add_breadcrumb "Acceuil", grvpc_index_path
  end

  def all_alertes
    @alerte = Alerte.order(created_at: :desc)
    add_breadcrumb "Alertes", grvpc_all_alertes_path
  end

  def alerte_today
    @alerte = Alerte.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    add_breadcrumb "Alertes du jour", grvpc_alerte_today_path
  end

  def alerte_week
    @alerte = Alerte.where(created_at: Date.today.beginning_of_week..Date.today.end_of_week)
    add_breadcrumb "Alertes de la semaine", grvpc_alerte_week_path
  end

  def detail_alerte
    index = params[:index]
    @alerte = Alerte.find(index)
    add_breadcrumb "détail de : #{@alerte.titre}", grvpc_alertes_detail_path
  end

  def alerte_resolue
    @alerte = Alerte.where(statu_id: 1)
  end

  def alerte_not_resolue
    @alerte = Alerte.where(statu_id: 2)
  end

  def all_contraventions
    @contravention = Convocation.order(created_at: :desc)
    add_breadcrumb "contraventions", grvpc_all_contraventions_path
  end

  def all_constats
    @constat = Constat.order(created_at: :desc)
    add_breadcrumb "tous les constats", grvpc_all_constats_path
  end

  def transmission_document
    @agent = Agent.order(created_at: :desc)
  end

  def detail_constat
    #retourn le detail des constats
    index = params[:index]

    @constat = Constat.find(index)
    add_breadcrumb "detail #{@constat.typeaccident.name}", grvpc_detail_constat_path
  end
end
