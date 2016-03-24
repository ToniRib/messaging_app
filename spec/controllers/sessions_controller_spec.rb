require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "responds with a successful HTTP 200 status code" do
      get :new

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "redirects to the user's dashboard if successful" do
      user = create(:user, username: "toni", password: "password")
      post :create, session: { username: "toni", password: "password" }

      expect(response.status).to eq(302)
      expect(response).to redirect_to(dashboard_path)
    end

    it "redirects to the login path if unsuccessful" do
      user = create(:user, username: "toni", password: "password")
      post :create, session: { username: "toni", password: "incorrect" }

      expect(response.status).to eq(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the root path" do
      delete :destroy

      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end
