require "rails_helper"

RSpec.describe "Create account", type: :feature do
  scenario "new user creates account" do
    visit root_path
    click_on "Create an Account"

    expect(current_path).to eq(new_account_path)

    fill_in "Username", with: "tonirib"
    fill_in "First name", with: "Toni"
    fill_in "Last name", with: "Rib"
    fill_in "Email", with: "toni@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create My Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, Toni")
  end

  scenario "password and password confirmation do not match" do
    visit new_user_path

    fill_in "Username", with: "tonirib"
    fill_in "First name", with: "Toni"
    fill_in "Last name", with: "Rib"
    fill_in "Email", with: "toni@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "incorrect"
    click_on "Create My Account"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("1 error prohibited this account from being saved")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
