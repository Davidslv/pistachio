require 'rails_helper'

RSpec.describe "PostcodeSearches", type: :request do
  describe "GET /postcode_searches/new" do
    it "returns http success" do
      get "/postcode_searches/new"
      expect(response).to have_http_status(:success)
    end
  end
end
