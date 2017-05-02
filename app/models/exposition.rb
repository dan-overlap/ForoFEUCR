class Exposition < ApplicationRecord
	belongs_to :user, :foreign_key => "presenter_id"
	belongs_to :presentation
end
