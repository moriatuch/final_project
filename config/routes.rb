Rails.application.routes.draw do
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
