Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :dwarves do
    resources :rentals, only: [:create, :update]
  end

  get "/profile", to: "pages#profile", as: :profile
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
