Feira::Application.routes.draw do

  resources :tamanhos

  resources :colecoes

  resources :linhas

  resources :tipos

  resources :cores

  root 'dashboard#index'

end
