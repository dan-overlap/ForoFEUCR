json.extract! discussion, :id, :comments_id, :amount_comments, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
