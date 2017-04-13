json.extract! comment, :id, :author_id, :title, :body, :replies_id, :likes_id, :dislikes_id, :is_important, :is_inappropriate, :reviewed, :denounced, :created_at, :updated_at
json.url comment_url(comment, format: :json)
