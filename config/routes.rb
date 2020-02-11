Rails.application.routes.draw do
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
