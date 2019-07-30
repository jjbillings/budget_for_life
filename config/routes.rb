Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  resources :savings_goals

  get 'welcome/index'

  root 'welcome#index'
end
