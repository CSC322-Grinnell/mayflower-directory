require 'rails_helper'

RSpec.describe "staffs/show", type: :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
