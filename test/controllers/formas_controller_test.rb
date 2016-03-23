require 'test_helper'

class FormasControllerTest < ActionController::TestCase
  setup do
    @forma = formas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forma" do
    assert_difference('Forma.count') do
      post :create, forma: { nome: @forma.nome }
    end

    assert_redirected_to forma_path(assigns(:forma))
  end

  test "should show forma" do
    get :show, id: @forma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forma
    assert_response :success
  end

  test "should update forma" do
    patch :update, id: @forma, forma: { nome: @forma.nome }
    assert_redirected_to forma_path(assigns(:forma))
  end

  test "should destroy forma" do
    assert_difference('Forma.count', -1) do
      delete :destroy, id: @forma
    end

    assert_redirected_to formas_path
  end
end
