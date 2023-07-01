Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "bank_accounts/:id", to: "bank_accounts#show"
  get "financial_accounts/:id", ro: "fintoc_accounts#show", as: :fintoc
end
