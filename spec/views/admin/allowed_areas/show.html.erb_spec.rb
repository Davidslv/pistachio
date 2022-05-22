require 'rails_helper'

RSpec.describe "admin/allowed_areas/show", type: :view do
  before(:each) do
    @admin_allowed_area = assign(:admin_allowed_area, Admin::AllowedArea.create!(
      area: "Area"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Area/)
  end
end
