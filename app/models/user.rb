class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  #validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@ucr\.ac\.cr\z/, message: ": Por favor ingrese con su correo oficial de la UCR" }

  has_many :presentations
  has_many :administrations
  has_many :congresses, :through => :administrations
  has_many :expositions
  has_many :presentations, :through => :expositions  
  has_many :authorships
  has_many :presentations, :through => :authorships  
  acts_as_voter
end
