require 'rails_helper'

RSpec.describe "User creates a song", type: :feature do

    it "saves and displays the song title" do
      visit new_song_path
      fill_in('Title', :with => 'Never gonna give you up')
      fill_in('Artist', :with => 'Rick Astley')
      click_link_or_button("Create Song")

      expect(page).to have_content('Never gonna give you up')
    end

end
