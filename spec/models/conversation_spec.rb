require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should validate_uniqueness_of(:user_id).scoped_to(:recipient_id) }

  describe "#initialize" do
    it "has two different users" do
      toni = create(:user, first_name: "Toni")
      dan = create(:user, first_name: "Dan")
      conversation = create(:conversation, user: toni, recipient: dan)

      expect(conversation.user).to eq(toni)
      expect(conversation.recipient).to eq(dan)
    end
  end

  describe "#messages" do
    it "can have a message from the user" do
      toni = create(:user, first_name: "Toni")
      dan = create(:user, first_name: "Dan")
      conversation = create(:conversation_with_messages,
                            user: toni, recipient: dan)

      user_for_first_message = conversation.messages.first.user

      expect(user_for_first_message).to eq(toni)
    end

    it "can have a message from the recipient" do
      toni = create(:user, first_name: "Toni")
      dan = create(:user, first_name: "Dan")
      conversation = create(:conversation_with_messages,
                            user: toni, recipient: dan)

      user_for_second_message = conversation.messages.last.user

      expect(user_for_second_message).to eq(dan)
    end
  end
  describe ".find_conversation_between" do
    it "locates a conversation between two individuals when user started it" do
      toni = create(:user, first_name: "Toni")
      dan = create(:user, first_name: "Dan")
      conversation = create(:conversation_with_messages,
                            user: toni, recipient: dan)

      located_conversation = Conversation.find_conversation_between(toni, dan).first

      expect(located_conversation).to eq(conversation)
    end

    it "locates a conversation between two individuals when recipient started it" do
      toni = create(:user, first_name: "Toni")
      dan = create(:user, first_name: "Dan")
      conversation = create(:conversation_with_messages,
                            user: dan, recipient: toni)

      located_conversation = Conversation.find_conversation_between(toni, dan).first

      expect(located_conversation).to eq(conversation)
    end
  end
end
