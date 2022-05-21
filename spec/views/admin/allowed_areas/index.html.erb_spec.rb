require 'rails_helper'

RSpec.describe "admin/allowed_areas/index", type: :view do
  before(:each) do
    assign(:admin_allowed_areas, [
      Admin::AllowedArea.create!(area: "Area 1"),
      Admin::AllowedArea.create!(area: "Area 2")
    ])
  end

  it "renders a list of admin/allowed_areas" do
    render

    expect(rendered).to include("Area 1").once
    expect(rendered).to include("Area 2").once
  end
end
