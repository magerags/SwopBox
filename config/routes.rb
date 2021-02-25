Rails.application.routes.draw do
  devise_for :users
  resource :visitors, :only => [:new, :create]
  root to: 'visitors#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
