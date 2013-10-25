require 'test_helper'

class FornecedoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
