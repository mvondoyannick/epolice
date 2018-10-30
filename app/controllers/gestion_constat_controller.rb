class GestionConstatController < ApplicationController
  layout 'fylo'
  def today
  end

  def hier
  end

  def week
  end

  def mounth
  end

  def all
    @constats = Constat.order(created_at: :asc)
  end

  def detail
    detail = params[:id]
  end

  def cartography
  end

  def region
  end

  def assureur
  end
end
