require 'rails_helper'

RSpec.describe "staffs/new", type: :view do
  before(:each) do
    assign(:staff, Staff.new())
  end

  it "renders new staff form" do
    render

    assert_select "form[action=?][method=?]", staffs_path, "post" do
    end
  end
end
