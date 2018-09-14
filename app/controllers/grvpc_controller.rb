class GrvpcController < ApplicationController
  before_action :authenticate_grvpc!, only: [:index]
  def index
    @alerte = Alerte.order(created_at: :desc).limit(10)
    @contravention = Convocation.order(created_at: :desc).limit(10)
    @constat = Constat.order(created_at: :desc).limit(10)
    render layout: 'grvpc/grvpc'
  end

  def all_alertes
    @alerte = Alerte.order(created_at: :desc)
    render layout: 'grvpc/grvpc'
  end

  def alerte_today
    @alerte = Alerte.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    render layout: 'grvpc/grvpc'
  end

  def alerte_week
    @alerte = Alerte.where(created_at: Date.today.beginning_of_week..Date.today.end_of_week)
    render layout: 'grvpc/grvpc'
  end

  def detail_alerte
    index = params[:index]
    @alerte = Alerte.find(index)
    render layout: 'grvpc/grvpc'
  end

  def alerte_resolue
    @alerte = Alerte.where(statu_id: 1)
    render layout: 'grvpc/grvpc'
  end

  def alerte_not_resolue
    @alerte = Alerte.where(statu_id: 2)
    render layout: 'grvpc/grvpc'
  end

  def all_contraventions
    @contravention = Convocation.order(created_at: :desc)
    render layout: 'grvpc/grvpc'
  end

  def all_constats
    @constat = Constat.order(created_at: :desc)
    render layout: 'grvpc/grvpc'
  end

  def transmission_document
    @agent = Agent.order(created_at: :desc)
    render layout: 'grvpc/grvpc'
  end
end
