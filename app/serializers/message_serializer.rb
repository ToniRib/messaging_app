class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :username, :sent_at

  def username
    User.find(object.user_id).username
  end

  def sent_at
    object.sent_at_date_and_time
  end
end
