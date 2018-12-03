class Api::V1::Partner::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:authenticate]
  def start
    render plain: 'welcome'
  end

  #liste des alertes
  def alertes
    region = params[:id]
    alerte = Alerte.where(region_id: region).order(id: :desc)
    render json:
      {
        result: alerte.map do |data|
          {
            id: data.id,
            titre: data.titre,
            description: data.description,
            date: data.created_at,
            type: Type.find(data.type_id).name,
            longitude: data.longitude,
            latitude: data.latitude,
            statut: data.statu_id,
            region: Region.find(data.region_id).name,
            arrondissement: Arrondissement.find(data.arrondissement_id).name,
            lieu_dit: data.lieudit,
            #photo: image_tag('logo_mobile.png')
          }
        end
      }
  end

  #authentification des partenaires sur la plateforme
  def authenticate
    query = Agent.where(name: params[:login], phone: params[:password]).last

    if query
      render json:
                 {
        message: :succes,
        partner: query,
        #blueprint: SecureRandom.hex(10),
        created_at: Date.today,
        expire_in: 5.hour.from_now,

      }
    else
      render json: {
          message: :failed
      }
    end
  end

  private
   def authenticate_params
     params.permit(:email, :password)
   end
end