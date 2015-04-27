require 'digest/sha1'

class User < ActiveRecord::Base
  before_create :generate_authentication_token

  def password= password
    self.encrypted_password = Digest::SHA1.hexdigest(password)
  end

  def self.authenticate username, password
    encrypted_password = Digest::SHA1.hexdigest(password)
    if user = User.find_by(username: username, encrypted_password: encrypted_password)
      user.generate_authentication_token
      user.save
    end
    user
  end

  def generate_authentication_token
    self.authentication_token = SecureRandom.base64(64)
  end
end
