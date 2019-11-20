Rails.application.routes.draw do
  devise_for :users
  root to: 'food_trucks#index'
  resources :food_trucks, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reservations, only: [:index, :new, :create, :show] do
      resources :payments, only: :new
    end
  end
end
