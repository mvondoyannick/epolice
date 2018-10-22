json.extract! alerte, :id, :titre, :description, :date, :latitude, :longitude, :created_at, :updated_at
json.url alerte_url(alerte, format: :json)
