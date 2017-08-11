class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates_format_of :email, {with: Devise.email_regexp, message: ": Por favor ingrese con su correo oficial de la UCR" }
  validates :terms_of_service, acceptance: { message: ': Debe aceptar los términos y condiciones de uso' }
  has_many :presentations
  has_many :administrations
  has_many :congresses, :through => :administrations
  has_many :expositions
  has_many :presentations, :through => :expositions  
  has_many :authorships
  has_many :presentations, :through => :authorships  
  acts_as_voter
end
