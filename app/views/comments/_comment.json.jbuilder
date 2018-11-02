json.extract! comment, :id, :title, :content, :alerte_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
