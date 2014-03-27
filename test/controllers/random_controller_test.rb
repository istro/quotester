require 'test_helper'

class RandomControllerTest < ActionController::TestCase
  test "should get any_active" do
    get :any_active
    assert_response :success
  end

  test "should get group_active" do
    get :group_active
    assert_response :success
  end

end
