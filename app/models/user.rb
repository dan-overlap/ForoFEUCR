class User < ApplicationRecord
	belongs_to :comment
	belongs_to :presentation
	belongs_to :congress
end
