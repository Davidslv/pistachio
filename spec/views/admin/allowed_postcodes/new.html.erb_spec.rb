require 'rails_helper'

RSpec.describe "admin/allowed_postcodes/new", type: :view do
  before(:each) do
    assign(:admin_allowed_postcode, Admin::AllowedPostcode.new(
      postcode: "SH24 1AB"
    ))
  end

  it "renders new admin_allowed_postcode form" do
    render

    assert_select "form[action=?][method=?]", admin_allowed_postcodes_path, "post" do

      assert_select "input[name=?]", "admin_allowed_postcode[postcode]"
    end
  end
end
