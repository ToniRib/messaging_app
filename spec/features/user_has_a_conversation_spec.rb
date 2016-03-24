require "rails_helper"

RSpec.describe "User has a conversation", type: :feature do
  scenario "user views a conversation", js: true do
    conversation = create(:conversation_with_messages)
    user = conversation.user
    recipient = conversation.recipient
    message1, message2 = conversation.messages

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    visit conversation_path(recipient)

    within "#messages" do
      expect(page).to have_content(message1.body)
      expect(page).to have_content(message2.body)
      expect(page).to have_content(message1.sent_at_date_and_time)
      expect(page).to have_content(message2.sent_at_date_and_time)
      expect(page).to have_content(user.username)
      expect(page).to have_content(recipient.username)
    end
  end

  scenario "user sends a message", js: true do
    conversation = create(:conversation_with_messages)
    user = conversation.user
    recipient = conversation.recipient

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    visit conversation_path(recipient)

    fill_in "new_message", with: "new message"
    click_on "Send"

    within "#messages" do
      expect(page).to have_content("new message")
    end
  end
end
