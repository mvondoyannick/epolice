json.extract! bulletin, :id, :order, :debut, :fin, :region_id, :created_at, :updated_at
json.url bulletin_url(bulletin, format: :json)
