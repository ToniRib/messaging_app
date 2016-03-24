require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

  describe ".all_except" do
    it "returns all users except the one with the matching username" do
      user1, user2, user3 = create_list(:user, 3)

      users = User.all_except(user1.username)

      expect(users.count).to eq(2)
      expect(users).to include(user2)
      expect(users).to include(user3)
    end
  end

  describe "#full_name" do
    it "returns the user's first and last name" do
      user = create(:user, first_name: "Toni", last_name: "Rib")

      full_name = user.full_name

      expect(full_name).to eq("Toni Rib")
    end
  end
end
