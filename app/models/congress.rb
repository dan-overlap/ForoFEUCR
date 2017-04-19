class Congress < ApplicationRecord
  has_many :administrations
  has_one :user, :foreign_key => 'responsible'
  #has_one :calendar
  has_one :blog
  has_many :categories
  has_many :administrators, :through => :administrations, source: :user
  

end
