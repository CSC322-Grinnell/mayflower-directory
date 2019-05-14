require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :content => "MyText",
        :department_id => 2
      ),
      Service.create!(
        :content => "MyText",
        :department_id => 2
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
