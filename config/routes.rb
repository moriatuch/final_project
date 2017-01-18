Rails.application.routes.draw do
  get 'pages'
  root 'pages#index'

  resources :photos
  resources :pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
