require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:conversation_id) }

  describe "#sent_at_date_and_time" do
    it "formats the date the message was created" do
      date = DateTime.new(2016, 1, 10, 8, 30, 0, '-7')
      message = create(:message, created_at: date)

      formatted_date = message.sent_at_date_and_time

      expect(formatted_date). to eq(" 8:30am on Jan 10, 2016")
    end
  end
end
