require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "Friends", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/friend/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view" do
    it "returns http success" do
      get "/friend/view"
      expect(response).to have_http_status(:success)
    end
  end

end
