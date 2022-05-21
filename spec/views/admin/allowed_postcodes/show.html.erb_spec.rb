require 'rails_helper'

RSpec.describe "admin/allowed_postcodes/show", type: :view do
  before(:each) do
    @admin_allowed_postcode = assign(:admin_allowed_postcode, Admin::AllowedPostcode.create!(
      postcode: "SH24 1AB"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/SH24 1AB/)
  end
end
