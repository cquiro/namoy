class Recipe < ActiveRecord::Base
  validates  :name, :time_ready, :quantity, :flavor, :ingredients, :instructions, :image, presence: true
end
