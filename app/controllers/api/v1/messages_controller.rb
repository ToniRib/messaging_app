class Api::V1::MessagesController < ApplicationController
  before_action :set_conversation
  respond_to :json

  def index
    respond_with @conversation.messages
  end

  def create
    respond_with :api, :v1, @conversation.messages.create(body: params[:body],
                                                          user_id: params[:user_id])
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
