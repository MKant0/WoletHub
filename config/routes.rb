Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :movements, only: [:index, :new, :create, :show]
  resources :fintoc_accounts, only: [:new, :create, :show, :index]
  resources :recipient_accounts
  resources :transactions, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home", to: "pages#home", as: :home
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "bank_accounts", to: "bank_accounts#index"
  get "bank_accounts/new", to: "bank_accounts#new", as: :new_bank_account
  post "bank_accounts", to: "bank_accounts#create"
  get "bank_accounts/:id", to: "bank_accounts#show", as: :bank_account
  get "financial_accounts/:id", to: "fintoc_accounts#show", as: :fintoc
  get "profile", to: "pages#profile"
  post '/webhook', to: 'webhooks#receive'

end
