require 'rails_helper'

RSpec.describe "staffs/edit", type: :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!())
  end

  it "renders the edit staff form" do
    render

    assert_select "form[action=?][method=?]", staff_path(@staff), "post" do
    end
  end
end
