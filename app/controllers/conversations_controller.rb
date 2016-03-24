class ConversationsController < ApplicationController
  before_action :require_user

  def show
    recipient = User.find(params[:id])
    @conversation = find_conversation(current_user, recipient)
  end

  private

  def find_conversation(user, recipient)
    Conversation.find_or_create_by_relationship(user, recipient)
  end

  def require_user
    render file: "public/404" unless current_user
  end
end
