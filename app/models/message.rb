class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  def sent_at_date_and_time
    created_at.strftime("%l:%M%P on %b %e, %Y")
  end
end
