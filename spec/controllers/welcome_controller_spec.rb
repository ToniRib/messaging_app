require "rails_helper"

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "responds with a successful HTTP 200 status code" do
      get :index

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end
end
