require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is valid with a name, email, subject and message" do
    message = Message.new(
      name: 'Pepe Grillo', 
      email: 'pepe@grillo.com',
      subject: 'Test Message',
      message: 'This is a test message for rspec. Hope it is fine.')

    expect(message).to be_valid
  end

  it "is invalid without a name" do
    message = Message.new(name: nil) 
    message.valid?
    expect(message.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    message = Message.new(email: nil) 
    message.valid?
    expect(message.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a subject" do
    message = Message.new(subject: nil) 
    message.valid?
    expect(message.errors[:subject]).to include("can't be blank")
  end

  it "is invalid without a message" do
    message = Message.new(message: nil) 
    message.valid?
    expect(message.errors[:message]).to include("can't be blank")
  end
end
