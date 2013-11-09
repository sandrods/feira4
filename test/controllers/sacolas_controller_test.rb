require 'test_helper'

class SacolasControllerTest < ActionController::TestCase
  setup do
    @sacola = sacolas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sacolas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sacola" do
    assert_difference('Sacola.count') do
      post :create, sacola: {  }
    end

    assert_redirected_to sacola_path(assigns(:sacola))
  end

  test "should show sacola" do
    get :show, id: @sacola
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sacola
    assert_response :success
  end

  test "should update sacola" do
    patch :update, id: @sacola, sacola: {  }
    assert_redirected_to sacola_path(assigns(:sacola))
  end

  test "should destroy sacola" do
    assert_difference('Sacola.count', -1) do
      delete :destroy, id: @sacola
    end

    assert_redirected_to sacolas_path
  end
end
