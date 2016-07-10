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

  it "is invalid without a country" do
    partner = build(:partner, country: nil)
    partner.valid?
    expect(partner.errors[:country]).to include("can't be blank")
  end

  it "is invalid without a city" do
    partner = build(:partner, city: nil)
    partner.valid?
    expect(partner.errors[:city]).to include("can't be blank")
  end

  it "is invalid without a logo" do
    partner = build(:partner, logo: nil)
    partner.valid?
    expect(partner.errors[:logo]).to include("can't be blank")
  end

  it "has a valid factory" do
    expect(build(:partner)).to be_valid
  end  
end
