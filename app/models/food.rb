class Food < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  enum type_food: { breakfast: 0, lunch: 1, dinner: 2 }

  has_one_attached :banner
  has_many :orders, dependent: :destroy
end
