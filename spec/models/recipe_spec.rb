require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "is valid with name, time_ready, quantity, flavor, ingredients, instructions and image" do
    recipe = build(:lemon_recipe)
    expect(recipe).to be_valid
  end

  it "is invalid without a name" do
    recipe = build(:natural_recipe, name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a time_ready" do
    recipe = build(:natural_recipe, time_ready: nil)
    recipe.valid?
    expect(recipe.errors[:time_ready]).to include("can't be blank")
  end

  it "is invalid without a quantity" do
    recipe = build(:natural_recipe, quantity: nil)
    recipe.valid?
    expect(recipe.errors[:quantity]).to include("can't be blank")
  end

  it "is invalid without a flavor" do
    recipe = build(:natural_recipe, flavor: nil)
    recipe.valid?
    expect(recipe.errors[:flavor]).to include("can't be blank")
  end

  it "is invalid without ingredients" do
    recipe = build(:natural_recipe, ingredients: nil)
    recipe.valid?
    expect(recipe.errors[:ingredients]).to include("can't be blank")
  end

  it "is invalid without instructions" do
    recipe = build(:natural_recipe, instructions: nil)
    recipe.valid?
    expect(recipe.errors[:instructions]).to include("can't be blank")
  end

  it "is invalid without an image" do
    recipe = build(:natural_recipe, image: nil)
    recipe.valid?
    expect(recipe.errors[:image]).to include("can't be blank")
  end

  it "has a valid factory" do
    expect(build(:natural_recipe)).to be_valid
  end  
end
