class ConversationsController < ApplicationController
  before_action :require_user

  def show
    recipient = User.find(params[:id])
    if Conversation.find_conversation_between(current_user, recipient).class == Conversation
      @conversation = Conversation.find_conversation_between(current_user, recipient)
    else
      @conversation = Conversation.create(user_id: current_user.id, recipient_id: recipient.id)
    end
  end

  private

  def require_user
    render file: "public/404" unless current_user
  end
end
