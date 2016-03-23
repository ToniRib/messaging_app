FactoryGirl.define do
  factory :message do
    body "What an amazing message!"
    conversation
    user
  end

  factory :conversation do
    user
    recipient

    factory :conversation_with_messages do
      after(:create) do |conversation, evaluator|
        create(:message, user: conversation.user, conversation: conversation)
        create(:message, user: conversation.recipient, conversation: conversation)
      end
    end
  end

  factory :user, aliases: [:recipient] do
    username
    first_name
    last_name
    email
    password "password"
  end

  sequence :username do |i|
    "username#{i}"
  end

  sequence :first_name do |i|
    "firstname#{i}"
  end

  sequence :last_name do |i|
    "lastname#{i}"
  end

  sequence :email do |i|
    "example#{i}@gmail.com"
  end
end
