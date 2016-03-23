FactoryGirl.define do
  factory :conversation do
    user
    recipient
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
