require 'rails_helper'

RSpec.describe "admin/allowed_areas/new", type: :view do
  before(:each) do
    assign(:admin_allowed_area, Admin::AllowedArea.new(
      area: "MyString"
    ))
  end

  it "renders new admin_allowed_area form" do
    render

    assert_select "form[action=?][method=?]", admin_allowed_areas_path, "post" do

      assert_select "input[name=?]", "admin_allowed_area[area]"
    end
  end
end
