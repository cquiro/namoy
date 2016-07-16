class User < ActiveRecord::Base
  has_secure_password
  validates :email, :name, presence: true
  validates :email, uniqueness: true
  before_save :downcase_email

  def downcase_email
    email.downcase!
  end

  def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
  end
end
