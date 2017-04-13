json.extract! news, :id, :title, :image, :content, :author_id, :created_at, :updated_at
json.url news_url(news, format: :json)
