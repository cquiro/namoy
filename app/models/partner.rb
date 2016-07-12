class Partner < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validates  :name, :country, :city, :logo, presence: true
end
