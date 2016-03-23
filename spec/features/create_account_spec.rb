require "rails_helper"

RSpec.describe "Create account", type: :feature do
  scenario "new user creates account" do
    visit root_path
    click on "Create Account"

    fill_in "Username", with: "tonirib"
    fill_in "First name", with: "Toni"
    fill_in "Last name", with: "Rib"
    fill_in "Email address", with: "toni@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Create My Account"

    
  end
end
