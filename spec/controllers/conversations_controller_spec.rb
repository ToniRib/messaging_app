require "rails_helper"

RSpec.describe ConversationsController, type: :controller do
  describe "GET #show" do
    it "returns a successful HTTP 200 status code" do
      user, recipient = create_list(:user, 2)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)

      get :show, id: recipient.id

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end

    it "correctly assigns conversation" do
      conversation = create(:conversation)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(conversation.user)

      get :show, id: conversation.recipient.id

      expect(assigns(:conversation)).to eq(conversation)
    end
  end
end
