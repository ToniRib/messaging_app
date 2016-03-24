require "rails_helper"

RSpec.describe "Log In", type: :feature do
  scenario "registered user logs in" do
    user = create(:user, username: "tonirib", password: "password", first_name: "Toni")

    visit root_path
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in "Username", with: "tonirib"
    fill_in "Password", with: "password"
    click_on "Log In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, Toni")
    expect(page).to have_content("Log Out")
    expect(page).not_to have_content("Log In")
  end
end
