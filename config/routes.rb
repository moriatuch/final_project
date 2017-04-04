Rails.application.routes.draw do


  get 'users_controller/home'

  get 'users_controller/home'
  get 'users_controller/help'

  get 'welcome/index'
  root 'users#index'
  root 'pages#index'
  get 'test/new'
  get 'welcome/index' => 'welcome#show'

  resources :users
  resources :photos
  resources :pages
  resources :test


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
