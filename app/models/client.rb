class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    allow_nil: true,
    uniqueness: true
  validates :DNI presence: true, uniqueness: true

  belongs_to :room
  has_many :orders, dependent: :destroy
  has_one :user
end
