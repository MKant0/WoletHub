Rails.application.routes.draw do
  devise_for :users
  resources :movements, only: [:index, :new, :create]

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "pages#dashboard", as: :dashboard
end
