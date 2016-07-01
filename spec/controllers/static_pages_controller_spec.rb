require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #products" do
    it "returns http success" do
      get :products
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #uses" do
    it "returns http success" do
      get :uses
      expect(response).to have_http_status(:success)
    end
  end

end
