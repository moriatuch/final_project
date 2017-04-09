Rails.application.routes.draw do
  get 'users/new'

  root 'pages#index'
  get 'uploads/count_cells'

  get 'uploads/compare_treatment'

  get 'uploads/dna_damage'
  get 'pages/about'

  get 'welcome/index'
  get 'welcome/index'
  resources :photos
  resources :pages
  resources :test

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
