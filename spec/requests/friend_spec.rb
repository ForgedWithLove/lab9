require 'rails_helper'

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

  context 'should give correct result' do
    it 'with 1000' do
      get '/friend/view?v1=1000'
      expect(assigns[:result]).to eq [[220, 284]]
    end
  end

end
