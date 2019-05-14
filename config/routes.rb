Rails.application.routes.draw do
  get 'welcome/index'

  resources :savings_goals

  root 'welcome#index'
end
