require 'rails_helper'

RSpec.describe "as the user", type: :feature do
  it "sees a login link on home page" do
    visit root_path

    expect(page).to have_link("Login", href: login_path)
  end

  it "can follow home login link to login form" do
    visit root_path
    click_link_or_button("Login")

    expect(current_path).to eq(login_path)

  end

  context "when credentials are valid" do
    it "can log in" do
      user = User.create(name: "Richard", password: "password")
      visit login_path
      fill_in("session[name]", with: user.name)
      fill_in("session[password]", with: user.password)
      click_link_or_button("Log in")

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("You are logged in as #{user.name}")
    end
  end

  context "when credentials are invalid" do
    it "receives error message" do
      user = User.create(name: "Richard", password: "password")
      visit login_path
      fill_in("session[name]", with: user.name)
      fill_in("session[password]", with: "wrong")
      click_link_or_button("Log in")

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
  end

  context "when logged in" do
    let(:user) { User.create(name: "Richard", password: "password") }
    before(:each) do
      visit login_path
      fill_in("session[name]", with: user.name)
      fill_in("session[password]", with: user.password)
      click_link_or_button("Log in")
    end

    it "does not see login link" do
      expect(page).to_not have_link("Login")
    end

    it "sees only her songs" do
      user.songs.create(title: "happy bday", artist: "sia")
      user.songs.create(title: "woman", artist: "rhye")
      user2 = User.create(name: "Raquel", password: "sample")
      user2.songs.create(title: "water", artist: "enya")

      visit songs_path

      expect(page).to have_content("happy bday")
      expect(page).to have_content("woman")
      expect(page).to_not have_content("water")

    end
  end

  context "when logged out" do
    xit "cannot see any songs" do

    end
  end
end
