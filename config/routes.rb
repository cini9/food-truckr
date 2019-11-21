Rails.application.routes.draw do
  root to: 'food_trucks#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :food_trucks, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reservations, only: [:new, :create, :show] do
      resources :payments, only: :new
    end
  end
  resources :reservations, only: [:index, :update]
end
