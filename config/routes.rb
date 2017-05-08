Rails.application.routes.draw do
  get 'dna/index'

  get 'dna/new'

  get 'dna/create'

  get 'dna/destroy'

  get 'compare/index'

  get 'compare/new'

  get 'compare/create'

  get 'compare/destroy'

  get 'count/index'

  get 'count/new'

  get 'count/create'

  get 'count/destroy'

  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  get 'sessions/new'

  get 'users/new'

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

  resources :resumes, only: [:index, :new, :create, :destroy]
  resources :compare, only: [:index, :new, :create, :destroy]
  resources :count, only: [:index, :new, :create, :destroy]
  resources :dna, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
