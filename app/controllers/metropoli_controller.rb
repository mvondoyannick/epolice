class MetropoliController < ApplicationController
  before_action :authenticate_metropoli!, only: [:index, :detail, :comptable, :submit]
  layout 'fylo'
  def index
    @convocations = Convocation.order(created_at: :desc).where(submit: nil)
  end

  def detail
    index = params[:index]
    @query = Convocation.find(index)
  end

  def submit
    index = params[:index]
    query = Convocation.find_by(id: index)
    query.submit = "transmitted"
    query.transmittedby = current_metropoli.email
    if query.save
      respond_to do |format|
        format.html do
          @query = query
          render layout: 'metropolis/metropolis'
        end
        format.json do
          render json: {
              status: 'saved',
              data: query
          }
        end
      end
    else
      respond_to do |format|
        format.html do
          @errors = query.errors.messages
        end
        format.json do
          render json: {
              status: 'failed',
              response: query.errors.messages
          }
        end
      end
    end
    #render layout: 'metropolis/metropolis'
  end

  def comptable
    @convocations = Convocation.where(submit: 'transmitted', buy: nil).order(created_at: :desc).all
  end
end
