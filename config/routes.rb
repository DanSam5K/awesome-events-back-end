Rails.application.routes.draw do
  resources :attendances
  resources :events
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/logged_user', to: 'logged_users#index'

  get '/events', to: 'events#index'
  post '/events', to: 'events#create'
  delete '/events/:id', to: 'events#destroy'

  get '/attendances', to: 'attendances#index'
  post '/attendances', to: 'attendances#create'
  delete '/attendances/:id', to: 'attendances#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
