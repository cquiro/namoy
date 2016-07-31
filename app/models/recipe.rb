class Recipe < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates  :name, :time_ready, :quantity, :flavor, :ingredients, :instructions, :image, presence: true
  validates :name, length: { maximum: 41 }
  validates :time_ready, length: { maximum: 15 }
  validates :quantity, length: { maximum: 12 }

  def string_to_array(paragraph) #intended for breaking the string into lines
    paragraph.split("\n")
  end
end
