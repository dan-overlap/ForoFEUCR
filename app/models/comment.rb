class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :replies
  belongs_to :likes
  belongs_to :dislikes
end
