require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in('Title', :with => 'Never gonna give you up')
    fill_in('Artist', :with => 'Rick Astley')
    click_link_or_button("Create Song")
    assert page.has_content?("Never gonna give you up")
  end

  test "user cannot create a song without a title" do
    skip
    visit new_song_path
    fill_in('Artist', :with => '')
    click_link_or_button("Create Song")
    assert page.has_content?("Please enter a song title")
  end
end
