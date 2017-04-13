class Congress < ApplicationRecord
  belongs_to :responsible
  belongs_to :calendar
  belongs_to :blog
  belongs_to :categories
  belongs_to :administrators
end
