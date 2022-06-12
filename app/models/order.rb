class Order < ApplicationRecord
  enum place: { room: 0, rest: 1 }
  enum state: { pending: 0, cacelled: 1, delivered: 2 }

  belongs_to :food
  belongs_to :client
end
