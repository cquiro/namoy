require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "is valid with name, time_ready, quantity, flavor, ingredients, instructions and image" do
    recipe = Recipe.new(
      name: "Cafe Helado",
      time_ready: "10 minutos", 
      quantity: "1 vaso", 
      flavor: "natural", 
      ingredients: "Cafe, helado y panela Namoy", 
      instructions: "Ponga todos los ingredientes en un vase y revuelva", 
      image: "Foto")

    expect(recipe).to be_valid
  end

end
