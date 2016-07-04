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

  it "is invalid without a name" do
    recipe = Recipe.new(name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a time_ready" do
    recipe = Recipe.new(time_ready: nil)
    recipe.valid?
    expect(recipe.errors[:time_ready]).to include("can't be blank")
  end

  it "is invalid without a quantity" do
    recipe = Recipe.new(quantity: nil)
    recipe.valid?
    expect(recipe.errors[:quantity]).to include("can't be blank")
  end

  it "is invalid without a flavor" do
    recipe = Recipe.new(flavor: nil)
    recipe.valid?
    expect(recipe.errors[:flavor]).to include("can't be blank")
  end

  it "is invalid without ingredients" do
    recipe = Recipe.new(ingredients: nil)
    recipe.valid?
    expect(recipe.errors[:ingredients]).to include("can't be blank")
  end

  it "is invalid without instructions" do
    recipe = Recipe.new(instructions: nil)
    recipe.valid?
    expect(recipe.errors[:instructions]).to include("can't be blank")
  end

  it "is invalid without an image" do
    recipe = Recipe.new(image: nil)
    recipe.valid?
    expect(recipe.errors[:image]).to include("can't be blank")
  end
end
