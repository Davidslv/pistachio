require "rails_helper"

RSpec.describe Admin::AllowedPostcodesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/allowed_postcodes").to route_to("admin/allowed_postcodes#index")
    end

    it "routes to #new" do
      expect(get: "/admin/allowed_postcodes/new").to route_to("admin/allowed_postcodes#new")
    end

    it "routes to #show" do
      expect(get: "/admin/allowed_postcodes/1").to route_to("admin/allowed_postcodes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/allowed_postcodes/1/edit").to route_to("admin/allowed_postcodes#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/admin/allowed_postcodes").to route_to("admin/allowed_postcodes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/allowed_postcodes/1").to route_to("admin/allowed_postcodes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/allowed_postcodes/1").to route_to("admin/allowed_postcodes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/allowed_postcodes/1").to route_to("admin/allowed_postcodes#destroy", id: "1")
    end
  end
end
