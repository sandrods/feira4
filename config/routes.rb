Feira::Application.routes.draw do

  resources :fornecedores

  resources :clientes

  resources :tamanhos

  resources :colecoes

  resources :linhas

  resources :tipos

  resources :cores

  root 'dashboard#index'

end
