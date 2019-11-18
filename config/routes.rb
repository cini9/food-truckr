Rails.application.routes.draw do
  devise_for :users
  root to: 'food_trucks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :food_trucks, only: [:index, :show, :new, :create]
end
