class Room < ApplicationRecord
  has_one_attached :banner
  has_one :client
end
