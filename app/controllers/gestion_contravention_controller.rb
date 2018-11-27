class GestionContraventionController < ApplicationController
  before_action :authenticate_admin!
  layout 'views/index'
  def today
    @today = Convocation.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).order(created_at: :desc)

  end

  def week
    @week = Convocation.where(created_at: 7.days.ago..Date.today).order(created_at: :desc)

  end

  def mounth
    @mois = Convocation.where(created_at: 30.days.ago..Date.today).order(created_at: :desc)

  end

  def month_detail
    id = params[:convocation_id]
    @query = Convocation.find(id)

  end

  def cartography

  end

  def region

  end

  #permet de gere la recherche par periode
  def periode
    @debut = params[:debut]
    @fin = params[:fin]
    @query = Alerte.where(created_at: params[:debut]..params[:fin]).order(created_at: :desc)

  end

  def all
    respond_to do |format|
      format.html do
        @all = Convocation.order(created_at: :desc)

      end
      format.xls
      format.pdf do
        pdf = PrintPdf.new
        send_data pdf.render, filename: "all_contravention.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end

  end
end
