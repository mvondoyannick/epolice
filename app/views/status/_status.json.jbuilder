json.extract! status, :id, :name, :detail, :created_at, :updated_at
json.url status_url(status, format: :json)
