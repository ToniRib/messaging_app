require "rails_helper"

RSpec.describe "Log In", type: :feature do
  scenario "registered user logs in" do
    user = create(:user, username: "tonirib", password: "password", first_name: "Toni")

    visit root_path
    within ".welcome-links" do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)

    fill_in "Username", with: "tonirib"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Log In"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, Toni")
    expect(page).to have_content("Log Out")
    expect(page).not_to have_content("Log In")
  end

  scenario "unregistered user tries to log in" do
    visit login_path

    fill_in "Username", with: "notregistered"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login credentials.")
  end

  scenario "registered user tries to log in with incorrect password" do
    user = create(:user, username: "tonirib", password: "password")

    visit login_path

    fill_in "Username", with: "tonirib"
    fill_in "Password", with: "incorrect"
    within "form" do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login credentials.")
  end

  scenario "registered user tries to log in with incorrect username" do
    user = create(:user, username: "tonirib", password: "password")

    visit login_path

    fill_in "Username", with: "incorrect"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login credentials.")
  end
end
