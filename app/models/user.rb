class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  enum type_user: { normal: 0, admin: 1 }

  has_secure_password
  has_secure_token
  has_one_attached :avatar
  belongs_to :client

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(username, password)
    user = find_by(username: username)
    user&.authenticate(password)
  end
end
