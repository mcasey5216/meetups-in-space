require 'spec_helper'

feature "User views the index page" do
  scenario "user sees a list of meetups" do
    Meetup.create!(name: "Space exploration!", description: "See name...", location:"Moon")
    Meetup.create!(name: "Cross Pluto Skiing", description: "Also see name...", location:"Pluto")
    visit '/'

    expect(page).to have_content("Space exploration!")
    expect(page).to have_content("Cross Pluto Skiing")
  end

  scenario "user can click a link to submit new form" do
    visit '/'

    click_link "Click here to Submit a Meetup that's out of this world!!"
    expect(page).to have_content("Name of Meetup")

  end
end
