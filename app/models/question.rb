class Question < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 40, message: "Title must be at least 40 characters long" }
  validates :description, presence: true, length: { minimum: 150, message: "Description must be at least 150 characters long" }
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy
end
