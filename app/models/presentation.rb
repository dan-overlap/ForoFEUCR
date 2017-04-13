class Presentation < ApplicationRecord
  has_many :users, :foreign_key => 'authors'
  has_one :user, :foreign_key => 'uploader'
  has_one :discussion
  has_many :presenters
  has_many :users, :foreign_key => 'likes'
  has_many :users, :foreign_key => 'dislikes'
end
