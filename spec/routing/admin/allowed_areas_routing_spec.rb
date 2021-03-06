require "rails_helper"

RSpec.describe Admin::AllowedAreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/allowed_areas").to route_to("admin/allowed_areas#index")
    end

    it "routes to #new" do
      expect(get: "/admin/allowed_areas/new").to route_to("admin/allowed_areas#new")
    end

    it "routes to #show" do
      expect(get: "/admin/allowed_areas/1").to route_to("admin/allowed_areas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/allowed_areas/1/edit").to route_to("admin/allowed_areas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/allowed_areas").to route_to("admin/allowed_areas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/allowed_areas/1").to route_to("admin/allowed_areas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/allowed_areas/1").to route_to("admin/allowed_areas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/allowed_areas/1").to route_to("admin/allowed_areas#destroy", id: "1")
    end
  end
end
