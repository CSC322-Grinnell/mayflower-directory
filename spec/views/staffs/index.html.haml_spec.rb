require 'rails_helper'

RSpec.describe "staffs/index", type: :view do
  before(:each) do
    assign(:staffs, [
      Staff.create!(),
      Staff.create!()
    ])
  end

  it "renders a list of staffs" do
    render
  end
end
