require "rails_helper"

RSpec.describe "Log out", type: :feature do
  scenario "logged in user logs out" do
    user = create(:user, username: "tonirib", password: "password", first_name: "Toni")

    visit login_path

    fill_in "Username", with: "tonirib"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Log In"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, Toni")
    expect(page).to have_content("Log Out")
    expect(page).not_to have_content("Log In")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Log In")
    expect(page).not_to have_content("Log Out")
  end
end
