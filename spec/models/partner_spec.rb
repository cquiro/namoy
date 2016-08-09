require 'rails_helper'

RSpec.describe Partner, type: :model do
  it "is valid with name, country, city, logo, instagram, facebook and website" do
    partner = build(:partner)
    expect(partner).to be_valid
  end

  it "is invalid without a name" do
    partner = build(:partner, name: nil)
    partner.valid?
    expect(partner.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a name longer than 17 chars" do
    partner = build(:partner, name: "18 characters long")
    partner.valid?
    expect(partner.errors[:name]).to include("is too long (maximum is 17 characters)")
  end

  it "is valid with a name 17 characters long" do
    partner = build(:partner, name: "17 character name")
    expect(partner).to be_valid
  end

  it "is invalid without a country" do
    partner = build(:partner, country: nil)
    partner.valid?
    expect(partner.errors[:country]).to include("can't be blank")
  end

  it "is invalid with a country name longer than 11 characters" do
    partner = build(:partner, country: "12 char name")
    partner.valid?
    expect(partner.errors[:country]).to include("is too long (maximum is 11 characters)")
  end

  it "is valid with a country name 11 characters long" do
    partner = build(:partner, country: "11char2name")
    expect(partner).to be_valid
  end

  it "is invalid without a city" do
    partner = build(:partner, city: nil)
    partner.valid?
    expect(partner.errors[:city]).to include("can't be blank")
  end

  it "is invalid with a city name longer than 8 characters" do
    partner = build(:partner, city: "9charname")
    partner.valid?
    expect(partner.errors[:city]).to include("is too long (maximum is 8 characters)")
  end

  it "is valid with a city name 8 characters long" do
    partner = build(:partner, city: "8 chars_")
    expect(partner).to be_valid
  end

  it "is invalid without a logo" do
    partner = build(:partner, logo: nil)
    partner.valid?
    expect(partner.errors[:logo]).to include("can't be blank")
  end

  it "retrieves the image name form the logo url" do
    partner = build(:partner)
    expect(partner.image_name).to eq("logo_blanco_letras.png")
  end

  it "has a valid factory" do
    expect(build(:partner)).to be_valid
  end  
end
