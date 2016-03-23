require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it "has two different users" do
    toni = create(:user, first_name: "Toni")
    dan = create(:user, first_name: "Dan")
    conversation = create(:conversation, user: toni, recipient: dan)

    expect(conversation.user).to eq(toni)
    expect(conversation.recipient).to eq(dan)
  end
end
