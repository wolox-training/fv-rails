class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

<<<<<<< HEAD
  validates :first_name, presence: true
  validates :last_name, presence: true

  # attr_reader :verification_code
=======
  validates_presence_of :first_name
  validates_presence_of :last_name
>>>>>>> 31570a9... Added shoulda_matchers gem, added User tests and modified User to match those tests
end
