Rails.application.routes.draw do
  devise_for :users
  resources :visitors, :only => [:new, :create]
  resources :boxes do
    resources :events do 
      resources :bookings, :only => [:new, :create]
      get "/bookings/confirmation", to: 'bookings#confirmation'
    end
  end
  resources :bookings, only: [:show, :destroy, :index] do
    resources :reviews
    resources :tickets
  end
  root to: 'visitors#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
