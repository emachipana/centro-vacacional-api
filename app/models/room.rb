class Room < ApplicationRecord
  validates :num_room, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }

  has_one_attached :banner
  has_one :client
end
