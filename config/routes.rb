Rails.application.routes.draw do

  resources :categorias

  resources :registros

  resources :sacolas do
    resources :itens, controller: 'itens_sacola' do
      post 'devolver', on: :collection
    end
  end

  resources :vendas do
    resources :itens, controller: 'itens_venda'
    resources :registros
  end

  resources :compras do
    resources :registros
    resources :itens, controller: 'itens_compra'
  end

  resources :produtos do
    get :lucro, on: :collection
    resources :etiquetas
  end

  get 'etiquetas' => 'etiquetas#index', as: 'etiquetas'
  post 'etiquetas' => 'etiquetas#print', as: 'print_etiquetas'

  resources :fornecedores

  resources :clientes

  resources :tamanhos

  resources :colecoes

  resources :linhas

  resources :tipos

  resources :cores

  root 'dashboard#index'

end
