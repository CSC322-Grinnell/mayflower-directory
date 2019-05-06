require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :content => "MyText",
      :department_id => 1
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "textarea#service_content[name=?]", "service[content]"

      assert_select "input#service_department_id[name=?]", "service[department_id]"
    end
  end
end
