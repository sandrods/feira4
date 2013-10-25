require 'test_helper'

class ColecoesControllerTest < ActionController::TestCase
  setup do
    @colecao = colecoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colecoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colecao" do
    assert_difference('Colecao.count') do
      post :create, colecao: { descricao: @colecao.descricao }
    end

    assert_redirected_to colecao_path(assigns(:colecao))
  end

  test "should show colecao" do
    get :show, id: @colecao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colecao
    assert_response :success
  end

  test "should update colecao" do
    patch :update, id: @colecao, colecao: { descricao: @colecao.descricao }
    assert_redirected_to colecao_path(assigns(:colecao))
  end

  test "should destroy colecao" do
    assert_difference('Colecao.count', -1) do
      delete :destroy, id: @colecao
    end

    assert_redirected_to colecoes_path
  end
end
