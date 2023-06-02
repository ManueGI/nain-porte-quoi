Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :dwarves do
    resources :rentals, only: [:create, :update]
  end

  resources :rentals, only: [] do
    resources :reviews, only: [:new, :create]
  end

  get "/profile", to: "pages#profile", as: :profile
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  patch "rentals/:id/accept", to: "rentals#accept", as: :accept
  patch "rentals/:id/refuse", to: "rentals#refuse", as: :refuse
  delete "rentals/:id/destroy", to: "rentals#destroy", as: :destroy
  delete "dwarves/:id/destroy", to: "dwarves#destroy", as: :destroy_dwarf
 
  # Defines the root path route ("/")
  # root "articles#index"
end
