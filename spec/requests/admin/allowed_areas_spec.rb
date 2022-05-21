require 'rails_helper'

RSpec.describe "/admin/allowed_areas", type: :request do
  let(:valid_attributes) {
    { area: 'Southwark 034A'}
  }

  let(:invalid_attributes) {
    { area: '' }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin::AllowedArea.create! valid_attributes
      get admin_allowed_areas_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      allowed_area = Admin::AllowedArea.create! valid_attributes
      get admin_allowed_area_url(allowed_area)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_allowed_area_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      allowed_area = Admin::AllowedArea.create! valid_attributes
      get edit_admin_allowed_area_url(allowed_area)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::AllowedArea" do
        expect {
          post admin_allowed_areas_url, params: { admin_allowed_area: valid_attributes }
        }.to change(Admin::AllowedArea, :count).by(1)
      end

      it "redirects to the created admin_allowed_area" do
        post admin_allowed_areas_url, params: { admin_allowed_area: valid_attributes }

        resource = Admin::AllowedArea.find_by(area: valid_attributes[:area])
        expect(response).to redirect_to(admin_allowed_area_url(resource))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::AllowedArea" do
        expect {
          post admin_allowed_areas_url, params: { admin_allowed_area: invalid_attributes }
        }.to change(Admin::AllowedArea, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_allowed_areas_url, params: { admin_allowed_area: invalid_attributes }
        expect(response.response_code).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { area: 'Lambeth 036B' }
      }

      it "updates the requested admin_allowed_area" do
        allowed_area = Admin::AllowedArea.create! valid_attributes
        patch admin_allowed_area_url(allowed_area), params: { admin_allowed_area: new_attributes }
        allowed_area.reload

        expect(allowed_area.area).to eq('Lambeth 036B')
      end

      it "redirects to the admin_allowed_area" do
        allowed_area = Admin::AllowedArea.create! valid_attributes
        patch admin_allowed_area_url(allowed_area), params: { admin_allowed_area: new_attributes }
        allowed_area.reload
        expect(response).to redirect_to(admin_allowed_area_url(allowed_area))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        allowed_area = Admin::AllowedArea.create! valid_attributes
        patch admin_allowed_area_url(allowed_area), params: { admin_allowed_area: invalid_attributes }
        expect(response.response_code).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_allowed_area" do
      allowed_area = Admin::AllowedArea.create! valid_attributes
      expect {
        delete admin_allowed_area_url(allowed_area)
      }.to change(Admin::AllowedArea, :count).by(-1)
    end

    it "redirects to the admin_allowed_areas list" do
      allowed_area = Admin::AllowedArea.create! valid_attributes
      delete admin_allowed_area_url(allowed_area)
      expect(response).to redirect_to(admin_allowed_areas_url)
    end
  end
end
