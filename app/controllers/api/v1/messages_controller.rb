class Api::V1::MessagesController < ApplicationController
  respond_to :json

  def index
    respond_with Conversation.find(params[:conversation_id]).messages
  end
end
