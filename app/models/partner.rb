class Partner < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validates  :name, :country, :city, :logo, presence: true

  def image_name
    logo.to_s.split('/')[-1]
  end
end
