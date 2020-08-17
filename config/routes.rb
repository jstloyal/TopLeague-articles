Rails.application.routes.draw do
  root 'categories#index'
  resources :articles do
    resources :votes
  end

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  resources :users, except: [:edit, :show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'home#index'

  resources :categories, except: [:destroy]
end
