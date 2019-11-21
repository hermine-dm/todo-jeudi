Rails.application.routes.draw do
  root to: 'emails#index'
  devise_for :users
  #root to: "home#index"
  resources :emails, only: [:create, :show, :destroy]
  resources :tasks, except: [:show]
  resources :home, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
