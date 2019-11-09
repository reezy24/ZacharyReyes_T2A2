require 'rails_helper'

RSpec.describe ProjectDashboardController, type: :controller do

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #members" do
    it "returns http success" do
      get :members
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #requests" do
    it "returns http success" do
      get :requests
      expect(response).to have_http_status(:success)
    end
  end

end
