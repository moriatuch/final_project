Rails.application.routes.draw do
  root 'pages#index'

  resources :photos
  resources :pages
  resources :layout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
