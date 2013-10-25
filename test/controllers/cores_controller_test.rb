require 'test_helper'

class CoresControllerTest < ActionController::TestCase
  setup do
    @cor = cores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cor" do
    assert_difference('Cor.count') do
      post :create, cor: {  }
    end

    assert_redirected_to cor_path(assigns(:cor))
  end

  test "should show cor" do
    get :show, id: @cor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cor
    assert_response :success
  end

  test "should update cor" do
    patch :update, id: @cor, cor: {  }
    assert_redirected_to cor_path(assigns(:cor))
  end

  test "should destroy cor" do
    assert_difference('Cor.count', -1) do
      delete :destroy, id: @cor
    end

    assert_redirected_to cores_path
  end
end
