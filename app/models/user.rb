class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true ,length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true ,length: { maximum: 100 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
  has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }
  validates :comment,{length: {maximum: 255}}


  # def self.new_remember_token
  #   SecureRandom.urlsafe_base64
  # end

  # def self.encrypt(token)
  #   Digest::SHA256.hexdigest(token.to_s)
  # end


end