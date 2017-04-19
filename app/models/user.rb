class User < ApplicationRecord
	has_many :adminstrations
	has_many :comments
	has_many :presentations
	has_many :congresses, :through => :administrations
end
