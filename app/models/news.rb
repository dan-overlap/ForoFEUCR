class News < ApplicationRecord
  has_one :user, :foreing_key => 'author'
  belongs_to :blog
end
