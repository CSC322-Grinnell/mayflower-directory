require 'test_helper'

class FrizbeesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get frizbees_new_url
    assert_response :success
  end

end
