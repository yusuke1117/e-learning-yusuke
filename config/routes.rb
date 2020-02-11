Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'

end
