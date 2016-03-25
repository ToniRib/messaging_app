class Api::V1::MessagesController < ApplicationController
  before_action :set_conversation
  respond_to :json

  def index
    respond_with @conversation.messages
  end

  def create
    respond_with :api, :v1, @conversation.messages.create(body: params[:body],
                                                          user_id: current_user.id)
  end

  private

  def set_conversation
    user = current_user
    recipient = User.find(params[:recipient_id])

    @conversation = Conversation.find_or_create_by_relationship(user, recipient)
  end
end
