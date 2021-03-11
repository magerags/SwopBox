Rails.application.routes.draw do
  devise_for :users
  resources :visitors, :only => [:new, :create]
  resources :boxes do
    resources :events do 
      resources :bookings, :only => [:new, :create]
    end
  end
  resources :bookings, only: [:show, :delete, :index] do
    resources :reviews
  end
  root to: 'visitors#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
