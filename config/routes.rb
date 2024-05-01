Rails.application.routes.draw do
  root "restaurants#index"

  resources :restaurants, except: [:index] do
    resources :reviews, only: [:new, :create]

    collection do
      # /restaurants
      get :top
      get :info
    end

    member do
      # /restaurants/:id/
      get :chef
    end
  end

  resources :reviews, only: [:destroy]

  # get "restaurants/top", to: "restaurants#top"

  # get "up" => "rails/health#show", as: :rails_health_check
end
