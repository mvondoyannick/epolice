class Api::V1::Partner::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:authenticate]
  def start
    render plain: 'welcome'
  end

  #liste des alertes
  def alertes
    region = params[:id]
    alerte = Alerte.where(region_id: region).order(created_at: :desc).first(30)
    base_url = 'http://192.168.1.245/api/v1/partner/'
    #TODO revoir le probleme des images, il faut recuperer les images depuis les assets directement
    image_tab = Array.new
    image_tab.push(URI.join('http://192.168.1.245:3000/assets/epolice.PNG'))
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
            arrondissement: Arrondissement.where(region_id: data.region_id).map do |arrondissement|
              {
                arr_id: arrondissement.id,
                arr_name: arrondissement.name
              }
            end,
            lieu_dit: data.lieudit,
            images: image_tab
          }
        end
      }
  end

  #authentification des partenaires sur la plateforme
  def authenticate
    #query = Agent.where(name: params[:login], phone: params[:password]).last

    #start module authentication
    query = AuthenticatePartner::new(params[:login], params[:password])

    #render result to client requested authentication
    render json: query


=begin
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
          message: 'Adresse email ou mot de passe invalide.'
      }
    end
=end
  end

  def uuid_partner
    id = params[:uuid]
    puts "values are : #{params[:uuid]}"
  end

  def alerte_detail
    id = params[:id]
    query = Alerte.find(id)
    render json: {
        alert: query
    }
  end

  private
   def authenticate_params
     params.permit(:email, :password)
   end
end