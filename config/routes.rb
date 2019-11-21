Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'food_trucks#home'

  resources :food_trucks, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reservations, only: [:new, :create, :show] do
      get 'payments/new', to: 'payments#new'
      get 'payments/paid', to: 'payments#paid'
    end
  end
  resources :reservations, only: [:index, :update]
end
