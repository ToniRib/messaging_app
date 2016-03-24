require "rails_helper"

RSpec.describe Api::V1::MessagesController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }

    it "returns a successful HTTP 200 status code" do
      conversation = create(:conversation_with_messages)

      get :index, format: :json, conversation_id: conversation.id

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end

    it "returns a list of messages for a given conversation" do
      conversation = create(:conversation_with_messages)
      message1, message2 = conversation.messages

      get :index, format: :json, conversation_id: conversation.id

      expect(json_response.first[:body]).to eq(message1.body)
      expect(json_response.first[:username]).to eq(message1.user.username)
      expect(json_response.first[:sent_at]).to eq(message1.sent_at_date_and_time)
      expect(json_response.last[:body]).to eq(message2.body)
      expect(json_response.last[:username]).to eq(message2.user.username)
      expect(json_response.last[:sent_at]).to eq(message2.sent_at_date_and_time)
    end
  end

  describe "POST #create" do
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }

    it "returns a successful HTTP 200 status code" do
      conversation = create(:conversation_with_messages)

      post :create, format: :json, conversation_id: conversation.id,
                                   user_id: conversation.user.id,
                                   body: "message body"

      expect(response.status).to eq(201)
      expect(response).to be_successful
    end

    it "returns a list of messages for a given conversation" do
      conversation = create(:conversation_with_messages)

      post :create, format: :json, conversation_id: conversation.id,
                                   user_id: conversation.user.id,
                                   body: "message body"

      new_message = conversation.messages.last

      expect(json_response[:body]).to eq(new_message.body)
      expect(json_response[:username]).to eq(new_message.user.username)
      expect(json_response[:sent_at]).to eq(new_message.sent_at_date_and_time)
    end
  end
end
