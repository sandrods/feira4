Feira::Application.routes.draw do

  resources :produtos do
    get :lucro, on: :collection
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
