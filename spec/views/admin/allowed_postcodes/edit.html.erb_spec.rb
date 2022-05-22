require 'rails_helper'

RSpec.describe "admin/allowed_postcodes/edit", type: :view do
  before(:each) do
    @admin_allowed_postcode = assign(:admin_allowed_postcode, Admin::AllowedPostcode.create!(
      postcode: "SH24 1AA"
    ))
  end

  it "renders the edit admin_allowed_postcode form" do
    render

    assert_select "form[action=?][method=?]", admin_allowed_postcode_path(@admin_allowed_postcode), "post" do

      assert_select "input[name=?]", "admin_allowed_postcode[postcode]"
    end
  end
end
