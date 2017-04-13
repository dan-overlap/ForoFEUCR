class Comment < ApplicationRecord
  has_one :author
  has_many :comments, :foreign_key => 'replies'
  has_many :users, :foreign_key => 'likes'
  has_many :users, :foreign_key => 'dislikes'
end
