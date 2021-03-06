class News < ApplicationRecord
  has_one :user, :foreign_key => 'author'
  belongs_to :congress
  #Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-7.0.5-Q16'
  #has_attached_file :picture, default_url: "/images/:style/missing.png"
  has_attached_file :picture, content_type: { content_type: ["image/jpeg",    "image/gif", "image/jpg"] }
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  #validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  acts_as_votable
end
