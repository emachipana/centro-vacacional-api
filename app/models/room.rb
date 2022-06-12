class Room < ApplicationRecord
  validates :num_room, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :type_room, presence: true
  enum type_room: { matrimonial: 0, personal: 1, familiar: 2, parejas: 3 }

  has_one_attached :banner
  has_one :client
end
