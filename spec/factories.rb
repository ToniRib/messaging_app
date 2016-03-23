FactoryGirl.define do
  factory :user do
    username
    first_name "Toni"
    last_name "Rib"
    email
    password "password"
  end

  sequence :username  do |i|
    "username#{i}"
  end

  sequence :email do |i|
    "example#{i}@gmail.com"
  end
end
