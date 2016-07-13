require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with name, email and password_digest" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = build(:user, email: "PEPE@GRILLO.COM")
      expect { user.downcase_email }.to change{ user.email }.from("PEPE@GRILLO.COM").to("pepe@grillo.com")
    end

    it "downcases an email before saving" do
      user = build(:user, email: "PEPE@GRILLO.COM")
      expect(user.save).to be_truthy
      expect(user.email).to eq("pepe@grillo.com")
    end
  end

end
