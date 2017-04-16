class User < ApplicationRecord
	belongs_to :comment, optional: true
	belongs_to :presentation, optional: true
	belongs_to :congress, optional: true
end
