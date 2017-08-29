class Fact < ApplicationRecord
  has_many :feedbacks

  validates :tweet, presence: true, length: { maximum: 140, minimum: 1 }
  validates :username, presence: true  
end
