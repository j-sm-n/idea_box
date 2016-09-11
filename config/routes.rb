Rails.application.routes.draw do
  # root 'users#new'
  namespace :admin do
    resources :categories
    resources :images
  end

  resources :users, only: [:new, :create, :show] do
    resources :ideas
    resources :ideas_images
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
