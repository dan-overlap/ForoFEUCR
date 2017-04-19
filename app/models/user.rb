class User < ApplicationRecord
	has_many :adminstrations
	belongs_to :comment
	belongs_to :presentation
	has_many :users, :through => :administrations
end
