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

  it "is invalid with a name longer than 41 chars" do
    recipe = build(:natural_recipe, name: "Forty-Two characters long recipe test name")
    recipe.valid?
    expect(recipe.errors[:name]).to include("is too long (maximum is 41 characters)")
  end

  it "is valid with a name 41 characters long" do
    recipe = build(:natural_recipe, name: "Forty-One character long recipe test name")
    expect(recipe).to be_valid
  end

  it "is invalid without a time_ready" do
    recipe = build(:natural_recipe, time_ready: nil)
    recipe.valid?
    expect(recipe.errors[:time_ready]).to include("can't be blank")
  end

  it "is invalid with a time_ready longer than 15 chars" do
    recipe = build(:natural_recipe, time_ready: "16character name")
    recipe.valid?
    expect(recipe.errors[:time_ready]).to include("is too long (maximum is 15 characters)")
  end

  it "is valid with a time_ready 15 characters long" do
    recipe = build(:natural_recipe, time_ready: "16charactername")
    expect(recipe).to be_valid
  end

  it "is invalid without a quantity" do
    recipe = build(:natural_recipe, quantity: nil)
    recipe.valid?
    expect(recipe.errors[:quantity]).to include("can't be blank")
  end

  it "is invalid with a quantity longer than 12 chars" do
    recipe = build(:natural_recipe, quantity: "13 chars name")
    recipe.valid?
    expect(recipe.errors[:quantity]).to include("is too long (maximum is 12 characters)")
  end

  it "is valid with a quantity 12 characters long" do
    recipe = build(:natural_recipe, quantity: "12 char name")
    expect(recipe).to be_valid
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
