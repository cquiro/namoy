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

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
