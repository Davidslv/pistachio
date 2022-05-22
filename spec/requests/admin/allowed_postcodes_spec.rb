require 'rails_helper'

RSpec.describe "/admin/allowed_postcodes", type: :request do
  include AuthHelper

  let(:valid_attributes) { { postcode: 'SH24 1AA'} }

  let(:invalid_attributes) { { postcode: 'SH24 1AAB'} }

  describe "GET /index" do
    it "renders a successful response" do

      Admin::AllowedPostcode.create! valid_attributes
      get admin_allowed_postcodes_url, headers: headers
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      allowed_postcode = Admin::AllowedPostcode.create! valid_attributes

      get admin_allowed_postcode_url(allowed_postcode), headers: headers
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_allowed_postcode_url, headers: headers
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      allowed_postcode = Admin::AllowedPostcode.create! valid_attributes

      get edit_admin_allowed_postcode_url(allowed_postcode), headers: headers
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::AllowedPostcode" do
        expect {
          post admin_allowed_postcodes_url, params: { admin_allowed_postcode: valid_attributes }, headers: headers
        }.to change(Admin::AllowedPostcode, :count).by(1)
      end

      it "redirects to the created admin_allowed_postcode" do
        post admin_allowed_postcodes_url, params: { admin_allowed_postcode: valid_attributes }, headers: headers

        resource = Admin::AllowedPostcode.find_by(postcode: 'sh241aa')

        expect(response).to redirect_to(admin_allowed_postcode_url(resource))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::AllowedPostcode" do
        expect {
          post admin_allowed_postcodes_url, params: { admin_allowed_postcode: invalid_attributes }, headers: headers
        }.to change(Admin::AllowedPostcode, :count).by(0)
      end

      it "renders a 422 response" do
        post admin_allowed_postcodes_url, params: { admin_allowed_postcode: invalid_attributes }, headers: headers

        expect(response.response_code).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { postcode: 'SE1 7QD' }
      }

      it "updates the requested admin_allowed_postcode" do
        allowed_postcode = Admin::AllowedPostcode.create! valid_attributes
        patch admin_allowed_postcode_url(allowed_postcode), params: { admin_allowed_postcode: new_attributes }, headers: headers
        allowed_postcode.reload

        expect(allowed_postcode.postcode).to eq('se17qd')
      end

      it "redirects to the admin_allowed_postcode" do
        allowed_postcode = Admin::AllowedPostcode.create! valid_attributes
        patch admin_allowed_postcode_url(allowed_postcode), params: { admin_allowed_postcode: new_attributes }, headers: headers
        allowed_postcode.reload
        expect(response).to redirect_to(admin_allowed_postcode_url(allowed_postcode))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        allowed_postcode = Admin::AllowedPostcode.create! valid_attributes
        patch admin_allowed_postcode_url(allowed_postcode), params: { admin_allowed_postcode: invalid_attributes }, headers: headers

        expect(response.response_code).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_allowed_postcode" do
      allowed_postcode = Admin::AllowedPostcode.create! valid_attributes
      expect {
        delete admin_allowed_postcode_url(allowed_postcode), headers: headers
      }.to change(Admin::AllowedPostcode, :count).by(-1)
    end

    it "redirects to the admin_allowed_postcodes list" do
      allowed_postcode = Admin::AllowedPostcode.create! valid_attributes
      delete admin_allowed_postcode_url(allowed_postcode), headers: headers
      expect(response).to redirect_to(admin_allowed_postcodes_url)
    end
  end
end
