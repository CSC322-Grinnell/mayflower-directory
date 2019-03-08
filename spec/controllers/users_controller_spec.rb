require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # spec/routing/*.rb
  describe "routing to edit_info" do
    subject {get 'users/:id/edit_info'}
    it "routes /edit_info to users#edit_info" do
      expect(subject).to route_to(
        controller: 'users',
        action: 'edit_info',
        id: ":id"
      )
    end

    it "render edit_info view" do
      expect(subject).to render_template('edit_info')
    end
  end
end
