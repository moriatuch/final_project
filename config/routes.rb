Rails.application.routes.draw do
  get 'compares/index'

  get 'compares/new'

  get 'compares/create'

  get 'compares/destroy'

  get 'sessions/new'

  get 'users/new'

  get 'count/new'

  get 'count/index'

  get 'count/destroy'

  get 'count/create'

  root 'sessions#new'
  get 'uploads/count_cells'

  get 'uploads/compare_treatment'

  get 'uploads/dna_damage'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :photos
  resources :test
  resources :users
  resources :counts, only: [:index, :new, :create, :destroy]
  resources :compares, only: [:index, :new, :create, :destroy]

end