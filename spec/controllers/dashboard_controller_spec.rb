require "rails_helper"

RSpec.describe DashboardController, type: :controller do
  describe "GET #show" do
    it "responds with a successful HTTP 200 status code" do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)

      get :show

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end

    it "assigns users correctly" do
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user1)

      get :show

      expect(assigns(:users)).to eq([user2])
    end
  end
end
