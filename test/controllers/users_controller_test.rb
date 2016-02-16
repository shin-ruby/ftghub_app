require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "should get show" do
    get :show, id: @user
    assert_response :success
  end

end
