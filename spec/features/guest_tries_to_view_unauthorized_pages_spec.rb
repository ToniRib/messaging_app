require "rails_helper"

RSpec.describe "Guest tries to view unauthorized pages", type: :feature do
  scenario "dashboard path" do
    visit dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "conversation path" do
    user = create(:user)

    visit conversation_path(user)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
