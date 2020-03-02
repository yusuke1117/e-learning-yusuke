Rails.application.routes.draw do
  
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, only:[:create]
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :relationships, only: [:create, :destroy]

  resources :categories

  resources :lessons do
    resources :answers
  end
  
  namespace :admin do
    resources :categories do
      resources :words
    end
    resources :users
  end
end
