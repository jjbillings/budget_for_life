Rails.application.routes.draw do
  devise_for :users
  resources :savings_goals

  resources :users do |users|
    resources :savings_goals
  end

  get 'welcome/index'

  root 'welcome#index'
end
