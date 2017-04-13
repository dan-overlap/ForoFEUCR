class Congress < ApplicationRecord
  has_one :user, :foreign_key => 'responsible'
  has_one :calendar
  has_one :blog
  has_many :categories
  has_many :user, :foreign_key => 'administrators'
end
