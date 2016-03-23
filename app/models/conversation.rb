class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, class_name:  "User", foreign_key: :recipient_id
  has_many   :messages, dependent: :destroy

  validates_uniqueness_of :user_id, scope: :recipient_id

  scope :find_conversation_between, -> (user, recipient) do
    where("user_id = ? AND recipient_id = ? OR recipient_id = ? AND user_id = ?",
          user.id, recipient.id, user.id, recipient.id)
  end
end
