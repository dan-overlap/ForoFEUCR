class Congress < ApplicationRecord
  has_one :user, :foreign_key => 'responsible'
  #has_one :calendar
  has_one :blog
  has_many :categories
  has_many :users, :foreign_key => 'administrators'
end
