class Discussion < ApplicationRecord
  has_many :comments, optional: true
end
