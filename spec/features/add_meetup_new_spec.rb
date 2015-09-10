require 'spec_helper'

feature "User views the new page" do
  let(:user) { User.create(provider: "github", uid: "1324", username: "jarlax", email: "jarlax@launchacademy.com", avatar_url: "github.com")}

  scenario "user sees a form for adding a new meetup" do
    sign_in_as user

    visit '/submit'

    expect(page).to have_content("Name of Meetup")
    expect(page).to have_content("Location")
  end

  scenario "user must fill all forms" do
    sign_in_as user

    visit '/submit'

    fill_in "Name of Meetup", with: "Atomic Space Party"
    fill_in "Location", with: "Black hole"
    fill_in "Description", with: "Party in the Universe"

    click_button "submit"
    expect(page).to have_content("Atomic Space Party")

  end
end
