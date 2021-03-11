Rails.application.routes.draw do
  devise_for :users
  resources :visitors, :only => [:new, :create]
  resources :boxes
  resources :bookings
  resources :events
  resources :reviews
  root to: 'visitors#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
