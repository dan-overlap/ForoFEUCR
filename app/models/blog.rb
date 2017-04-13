class Blog < ApplicationRecord
  has_many :news
  belongs_to :congress
end
