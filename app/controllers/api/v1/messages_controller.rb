class Api::V1::MessagesController < ApplicationController
  before_action :set_conversation
  respond_to :json

  def index
    respond_with @conversation.messages
  end

  def create
    respond_with :api, :v1, @conversation.messages.create(body: params[:body],
                                                          user_id: session[:user_id])
  end

  private

  def set_conversation
    user = User.find(session[:user_id])
    recipient = User.find(params[:recipient_id])

    @conversation = Conversation.find_or_create_by_relationship(user, recipient)
  end
end
