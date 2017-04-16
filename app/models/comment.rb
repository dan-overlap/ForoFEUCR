class Comment < ApplicationRecord
  has_one :user,  :foreign_key  => 'author'
  has_many :comments, :foreign_key => 'replies'
  has_many :users, :foreign_key => 'likes'
  has_many :users, :foreign_key => 'dislikes'
  belongs_to :comment, optional: true
  belongs_to :discussion
end
