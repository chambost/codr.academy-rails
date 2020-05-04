json.extract! post, :id, :title, :content, :user, :edited, :time, :created_at, :updated_at
json.url post_url(post, format: :json)
