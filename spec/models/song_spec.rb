require 'rails_helper'

RSpec.describe Song, type: :model do

  it "is valid with title and artist" do
    song = Song.create(title: "One More Time", artist: "B Spears")
    expect(song).to be_valid
  end

  it "is invalid if missing artist" do
    song = Song.create(title: "hey", artist: nil)

    expect(song).to_not be_valid
  end

  it "is invalid if missing title" do
    song = Song.create(title: nil, artist: "Hey there")

    expect(song).to_not be_valid
  end

  it "belongs to a user" do
    user = User.create(name: "Sarah", password: "word")
    user.songs.create(title: "Oops", artist: "Coolio")
    song = user.songs.first

    expect(song.title).to eq("Oops")
  end
end
