class Partner < ActiveRecord::Base
  validates  :name, :country, :city, :logo, presence: true
end
