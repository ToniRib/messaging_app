require "rails_helper"

RSpec.describe "User views dashboard", type: :feature do
  scenario "sees a list of users not including themselves" do
    user = create(:user)
    other_users = create_list(:user, 2)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    visit dashboard_path

    within ".users-list" do
      expect(page).to have_content(other_users.first.username)
      expect(page).to have_content(other_users.last.username)
      expect(page).to_not have_content(user.username)
    end
  end
end
