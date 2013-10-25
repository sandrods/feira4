require 'test_helper'

class TamanhosControllerTest < ActionController::TestCase
  setup do
    @tamanho = tamanhos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tamanhos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tamanho" do
    assert_difference('Tamanho.count') do
      post :create, tamanho: { nome: @tamanho.nome }
    end

    assert_redirected_to tamanho_path(assigns(:tamanho))
  end

  test "should show tamanho" do
    get :show, id: @tamanho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tamanho
    assert_response :success
  end

  test "should update tamanho" do
    patch :update, id: @tamanho, tamanho: { nome: @tamanho.nome }
    assert_redirected_to tamanho_path(assigns(:tamanho))
  end

  test "should destroy tamanho" do
    assert_difference('Tamanho.count', -1) do
      delete :destroy, id: @tamanho
    end

    assert_redirected_to tamanhos_path
  end
end
