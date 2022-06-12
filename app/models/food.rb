class Food < ApplicationRecord
  has_one_attached :banner
  has_many :orders, dependent: :destroy
end
