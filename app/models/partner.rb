class Partner < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validates  :name, :country, :city, :logo, presence: true
  validates :name, length: { maximum: 17 }
  validates :country, length: { maximum: 11 }
  validates :city, length: { maximum: 8 }

  def image_name
    logo.to_s.split('/')[-1]
  end
end
