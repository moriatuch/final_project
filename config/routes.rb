Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'sessions#new'
  get 'uploads/count_cells'

  get 'uploads/compare_treatment'

  get 'uploads/dna_damage'

  get 'welcome/index'
  get 'welcome/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :photos
  resources :test
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
