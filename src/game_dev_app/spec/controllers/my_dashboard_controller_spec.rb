require 'rails_helper'

RSpec.describe MyDashboardController, type: :controller do

  describe "GET #projects" do
    it "returns http success" do
      get :projects
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #offers" do
    it "returns http success" do
      get :offers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #proposals" do
    it "returns http success" do
      get :proposals
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

end
