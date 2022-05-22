require 'rails_helper'

RSpec.describe "admin/allowed_areas/index", type: :view do
  before(:each) do
    assign(:admin_allowed_areas, [
      Admin::AllowedArea.new(area: "Area ALPHA"),
      Admin::AllowedArea.new(area: "Area BETA")
    ])
  end

  it "renders a list of admin/allowed_areas" do
    render

    expect(rendered).to include("Area ALPHA").once
    expect(rendered).to include("Area BETA").once
  end
end
