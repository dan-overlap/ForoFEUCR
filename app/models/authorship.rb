class Authorship < ApplicationRecord
	belongs_to :user, :foreign_key  => "author_id"
	belongs_to :presentation
end
