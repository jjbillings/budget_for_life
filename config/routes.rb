Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  resources :savings_goals

  root 'welcome#index'
end
