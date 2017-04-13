class Presentation < ApplicationRecord
  belongs_to :authors
  belongs_to :uploader
  belongs_to :discussion
  belongs_to :presenters
  belongs_to :likes
  belongs_to :dislikes
end
