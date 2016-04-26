Rails.application.routes.draw do

  root to: "sessions#new"

  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]
  resources :redemption_cards, only: [:create, :new, :show]
end
