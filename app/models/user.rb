class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :rememberable, :validatable
=======
         :recoverable, :rememberable, :validatable
>>>>>>> 1c05180... Fixed a few things for rubocop

  validates :first_name, presence: true
  validates :last_name, presence: true

  # attr_reader :verification_code
end
