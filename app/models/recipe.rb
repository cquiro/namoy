class Recipe < ActiveRecord::Base
  validates  :name, :time_ready, :quantity, :flavor, :ingredients, :instructions, :image, presence: true

  def string_to_array(paragraph) #intended for breaking the string into lines
    paragraph.split("\n")
  end
end
