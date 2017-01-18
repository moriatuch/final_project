Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#index'

  resources :myApp
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
