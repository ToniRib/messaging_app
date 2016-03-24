require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "responds with a successful HTTP 200 status code" do
      get :new

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "redirects the user to their dashboard if successful" do
      post :create, user: { first_name:            "Toni",
                            last_name:             "Rib",
                            email:                 "toni@example.com",
                            username:              "tonirib",
                            password:              "password",
                            password_confirmation: "password" }

      expect(response.status).to eq(302)
      expect(response).to redirect_to(dashboard_path)
    end

    it "creates a new user if successful" do
      post :create, user: { first_name:            "Toni",
                            last_name:             "Rib",
                            email:                 "toni@example.com",
                            username:              "tonirib",
                            password:              "password",
                            password_confirmation: "password" }

      user = User.last

      expect(User.count).to eq(1)
      expect(user.first_name).to eq("Toni")
      expect(user.last_name).to eq("Rib")
      expect(user.email).to eq("toni@example.com")
      expect(user.username).to eq("tonirib")
    end

    it "does not create a new user if not successful" do
      post :create, user: { first_name:            "Toni",
                            last_name:             "Rib",
                            email:                 "toni@example.com",
                            username:              "tonirib",
                            password:              "password",
                            password_confirmation: "incorrect" }

      expect(User.count).to eq(0)
    end
  end
end
