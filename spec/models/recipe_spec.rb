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
    recipe = build(:recipe, name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a time_ready" do
    recipe = build(:recipe, time_ready: nil)
    recipe.valid?
    expect(recipe.errors[:time_ready]).to include("can't be blank")
  end

  it "is invalid without a quantity" do
    recipe = build(:recipe, quantity: nil)
    recipe.valid?
    expect(recipe.errors[:quantity]).to include("can't be blank")
  end

  it "is invalid without a flavor" do
    recipe = build(:recipe, flavor: nil)
    recipe.valid?
    expect(recipe.errors[:flavor]).to include("can't be blank")
  end

  it "is invalid without ingredients" do
    recipe = build(:recipe, ingredients: nil)
    recipe.valid?
    expect(recipe.errors[:ingredients]).to include("can't be blank")
  end

  it "is invalid without instructions" do
    recipe = build(:recipe, instructions: nil)
    recipe.valid?
    expect(recipe.errors[:instructions]).to include("can't be blank")
  end

  it "is invalid without an image" do
    recipe = build(:recipe, image: nil)
    recipe.valid?
    expect(recipe.errors[:image]).to include("can't be blank")
  end

  it "has a valid factory" do
    expect(build(:recipe)).to be_valid
  end  
end
