class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true
  validates_presence_of :password, on: :create

  has_many :questions
  has_many :answers

  has_secure_password
end
