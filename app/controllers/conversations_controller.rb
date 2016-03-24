class ConversationsController < ApplicationController
  before_action :require_user

  def show
    recipient = User.find(params[:id])
    @conversation = Conversation.find_conversation_between(current_user, recipient)
  end

  private

  def require_user
    render file: "public/404" unless current_user
  end
end
