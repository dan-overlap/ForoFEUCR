class Presentation < ApplicationRecord
  has_many :expositions
  has_many :authorships
  belongs_to :user, :foreign_key => 'uploader_id'
  has_one :discussion
  has_many :presenters, :through => :expositions, :source => :user
  has_many :authors, :through => :authorships, :source => :user
  belongs_to :category, optional: true
  has_many :users, :foreign_key => 'likes'
  has_many :users, :foreign_key => 'dislikes'

  #attr_accessible :pdf_file
  

  has_attached_file :pdf_file
  validates_attachment_content_type :pdf_file, :content_type => ["application/pdf"]

  
end
