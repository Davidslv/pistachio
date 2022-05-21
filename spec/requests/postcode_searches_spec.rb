require 'rails_helper'

RSpec.describe "PostcodeSearches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/postcode_searches"
      expect(response).to have_http_status(:success)
    end
  end
end
