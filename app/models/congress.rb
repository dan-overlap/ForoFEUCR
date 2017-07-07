class Congress < ApplicationRecord
  has_many :administrations
  has_one :user, :foreign_key => 'responsible'
  #has_one :calendar
  has_many :news
  has_many :events
  has_many :categories
  has_many :downloads
  has_many :banners
  has_attached_file :favicon, content_type: { content_type: ["image/jpeg",    "image/gif", "image/jpg"] }
  validates_attachment_content_type :favicon, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :logo, content_type: { content_type: ["image/jpeg",    "image/gif", "image/jpg"] }
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :administrators, :through => :administrations, source: :user
  

end
