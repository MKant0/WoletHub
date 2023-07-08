Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :movements, only: [:index, :new, :create, :show]
  resources :paypopups
  resources :fintoc_accounts, only: [:new, :create, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home", to: "pages#home", as: :home
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "bank_accounts", to: "bank_accounts#index"
  get "bank_accounts/:id", to: "bank_accounts#show", as: :bank_account
  get "financial_accounts/:id", to: "fintoc_accounts#show", as: :fintoc
  get "profile", to: "pages#profile"
  post "data_fintoc", to: "webhooks#data_fintoc"
end
