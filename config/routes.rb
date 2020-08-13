Rails.application.routes.draw do
  root 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :votes
  end

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories
end
