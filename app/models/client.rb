class Client < ApplicationRecord
  belongs_to :room
  has_many :orders, dependent: :destroy
  has_one :user
end
