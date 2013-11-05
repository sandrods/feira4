Feira::Application.routes.draw do

  resources :compras do
    resources :registros
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
