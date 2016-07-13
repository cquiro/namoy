class User < ActiveRecord::Base
  validates :email, :name, presence: true
  validates :email, uniqueness: true
  before_save :downcase_email

  def downcase_email
    email.downcase!
  end
end
