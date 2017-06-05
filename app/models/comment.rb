class Comment < ApplicationRecord
  belongs_to :user,  :foreign_key  => 'author_id'
  has_many :replies
  has_many :comments, :through => :replies
  has_many :users, :foreign_key => 'likes'
  has_many :users, :foreign_key => 'dislikes'
  belongs_to :presentation, optional: true

end
