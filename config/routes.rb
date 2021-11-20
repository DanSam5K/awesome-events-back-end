Rails.application.routes.draw do
  resources :attendances
  resources :events
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/logged_user', to: 'logged_users#index'
  post '/events', to: 'events#create'
  delete '/events/:id', to: 'events#destroy'
  post '/attendances', to: 'attendances#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
