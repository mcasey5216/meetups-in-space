require 'spec_helper'

feature "User views the index page" do
  let(:user) { User.create(provider: "github", uid: "1324", username: "jarlax", email: "jarlax@launchacademy.com", avatar_url: "github.com")}
  scenario "user sees a list of meetups" do
    sign_in_as user

    expect(page).to have_content("jarlax")
  end
end
