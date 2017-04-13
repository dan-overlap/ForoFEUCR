json.extract! presentation, :id, :authors_id, :title, :abstract, :uploader_id, :document, :status, :discussion_id, :presenters_id, :likes_id, :dislikes_id, :created_at, :updated_at
json.url presentation_url(presentation, format: :json)
