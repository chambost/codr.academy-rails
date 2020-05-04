json.extract! user, :id, :username, :name, :cohort, :point, :github, :linked_in, :created_at, :updated_at
json.url user_url(user, format: :json)
