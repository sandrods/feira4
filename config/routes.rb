Feira::Application.routes.draw do

  resources :sacolas

  resources :vendas do
    resources :itens_venda
    resources :registros
  end

  resources :compras do
    resources :registros
    resources :itens_compra
  end

  resources :produtos do
    get :lucro, on: :collection
    resources :etiquetas
  end

  resources :fornecedores

  resources :clientes

  resources :tamanhos

  resources :colecoes

  resources :linhas

  resources :tipos

  resources :cores

  root 'dashboard#index'

end
