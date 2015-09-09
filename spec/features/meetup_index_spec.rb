require 'spec_helper'

feature "User views the index page" do
  scenario "user sees the correct title" do
    Meetup.create!(name: "Space exploration!", description: "See name...", location:"Moon")
    Meetup.create!(name: "Cross Pluto Skiing", description: "Also see name...", location:"Pluto")
    visit '/'

    expect(page).to have_content("Space exploration!")
    expect(page).to have_content("Cross Pluto Skiing")
  end
end
