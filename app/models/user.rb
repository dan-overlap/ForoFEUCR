class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@ucr\.ac\.cr\z/, message: ": Por favor ingrese con su correo oficial de la UCR" }
=======
         :recoverable, :rememberable, :trackable#, :validatable, :confirmable
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@ucr.ac.cr\.com\z/, message: ": Por favor ingrese con su correo oficial de la UCR" }
>>>>>>> 4f6b23688906aad9db8234684db60ea8d43db5f4
  has_many :presentations
  has_many :administrations
  has_many :congresses, :through => :administrations
  has_many :expositions
  has_many :presentations, :through => :expositions  
  has_many :authorships
  has_many :presentations, :through => :authorships  
  acts_as_voter
end
