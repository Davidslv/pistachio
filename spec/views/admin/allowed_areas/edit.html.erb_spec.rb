require 'rails_helper'

RSpec.describe "admin/allowed_areas/edit", type: :view do
  before(:each) do
    @admin_allowed_area = assign(:admin_allowed_area, Admin::AllowedArea.create!(
      area: "MyString"
    ))
  end

  it "renders the edit admin_allowed_area form" do
    render

    assert_select "form[action=?][method=?]", admin_allowed_area_path(@admin_allowed_area), "post" do

      assert_select "input[name=?]", "admin_allowed_area[area]"
    end
  end
end
