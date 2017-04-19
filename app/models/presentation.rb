class Presentation < ApplicationRecord
  has_many :users, :foreign_key => 'authors'
  has_one :user, :foreign_key => 'uploader'
  has_one :discussion
  has_many :presenters
<<<<<<< HEAD
  has_many :users, :foreign_key => 'likes'
  has_many :users, :foreign_key => 'dislikes'

  #attr_accessible :pdf_file
=======
  has_many :users, :foreign_key => 'dislikes'
  
>>>>>>> 41ba5017931fb4465bd172256aba8390ee68d4d9
  has_attached_file :pdf_file
  validates_attachment_content_type :pdf_file, :content_type => ["application/pdf"]

  #belongs_to :category
end
