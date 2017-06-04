class Event < ApplicationRecord
	has_one :user
  belongs_to :congress
end
