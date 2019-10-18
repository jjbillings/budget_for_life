Rails.application.routes.draw do
  resources :transactions
  resources :expenses
  resources :accounts
  devise_for :users
  resources :savings_goals

  get 'welcome/index'

  root 'welcome#index'
end
