class Administration < ApplicationRecord
  belongs_to :congress
  belongs_to :user
end
