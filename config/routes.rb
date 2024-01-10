Rails.application.routes.draw do
  devise_for :users
  root 'cars#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :cars, only: [:show] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update, :show, :destroy]
  get "/dashboard", to: "bookings#dashboard"

  # Defines the root path route ("/")
  # root "posts#index"
end
