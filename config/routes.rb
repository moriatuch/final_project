Rails.application.routes.draw do
  root 'pages#index'
  get 'test/new'
  get '/welcome' => 'welcome#show'

  resources :photos
  resources :pages
  resources :test

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
