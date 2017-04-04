Rails.application.routes.draw do
  get 'uploads/count_cells'

  get 'uploads/compare_treatment'

  get 'uploads/dna_damage'

  get 'users/new'

  get 'welcome/index'

  root 'pages#index'
  get 'test/new'
  get 'welcome/index'
  resources :photos
  resources :pages
  resources :test

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
