require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    user = User.create(name: "Markus", password: "password")

    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.create(name: nil, password: "f")

    expect(user).to_not be_valid
  end

  it "has a collection of songs" do
    user = User.create(name: "Jeff", password: "hey")
    user.songs.create(title: "What", artist: "the")
    user.songs.create(title: "cat", artist: "not creative")

    expect(user.songs.size).to eq(2)
    expect(user.songs.map(&:title)).to eq(["What", "cat"])
  end
end
