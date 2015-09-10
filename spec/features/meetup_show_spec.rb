require 'spec_helper'

feature "User views the new page" do
  let(:user) { User.create(provider: "github", uid: "1324", username: "jarlax", email: "jarlax@launchacademy.com", avatar_url: "github.com")}
  let(:meetup) { Meetup.create(name: "Atomic Party", location: "Black hole", description: "Party in Space. Woo!")}

  scenario "user sees details of meetup" do
    sign_in_as user

    visit "/#{meetup.id}"

    expect(page).to have_content("#{meetup.name}")
    expect(page).to have_content("#{meetup.location}")
    expect(page).to have_content("#{meetup.description}")
  end

  scenario "user sees members of meetup" do

    sign_in_as user

    visit "/#{meetup.id}"

    click_button "Join Now!"
    expect(page).to have_content("jarlax")

  end
end
