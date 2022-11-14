Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, path: 'auth'

  root to: "home#index"

  resources :users
end
