json.extract! user, :id, :name, :slug, :created_at, :updated_at
json.url user_url(user, format: :json)