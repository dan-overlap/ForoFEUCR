class Blog < ApplicationRecord
  has_many :news, optional: true
  belongs_to :congress
end
