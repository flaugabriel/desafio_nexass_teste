require 'rails_helper'

RSpec.describe "Infos", type: :request do

  describe "GET /info" do
    it "returns http success" do
      get "/info/info"
      expect(response).to have_http_status(:success)
    end
  end

end
