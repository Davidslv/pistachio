require 'rails_helper'

RSpec.describe "admin/allowed_postcodes/index", type: :view do
  before(:each) do
    assign(:admin_allowed_postcodes, [
      Admin::AllowedPostcode.create!(
        postcode: "SH24 1AA"
      ),
      Admin::AllowedPostcode.create!(
        postcode: "SH24 1AB"
      )
    ])
  end

  it "renders a list of admin/allowed_postcodes" do
    render

    expect(rendered).to include("SH24 1AA").once
    expect(rendered).to include("SH24 1AB").once
  end
end
