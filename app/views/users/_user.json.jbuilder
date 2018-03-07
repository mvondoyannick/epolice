json.extract! user, :id, :name, :prenom, :sexe, :cartegrise, :immatriculation, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
