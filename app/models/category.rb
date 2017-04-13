class Category < ApplicationRecord
  has_many :presentations
  belongs_to :congress
end
