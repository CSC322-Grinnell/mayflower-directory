require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :content => "MyText",
      :department_id => 1
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "textarea#service_content[name=?]", "service[content]"

      assert_select "input#service_department_id[name=?]", "service[department_id]"
    end
  end
end
