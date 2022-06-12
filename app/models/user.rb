class User < ApplicationRecord
  has_secure_password
  has_secure_token
  belongs_to :client

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(username, password)
    user = find_by(username: username)
    user&.authenticate(password)
  end
end
