require 'oath/constraints/signed_in'
require 'oath/constraints/signed_out'

Rails.application.routes.draw do
  constraints Oath::Constraints::SignedIn.new do
    root 'entries#index'
  end

  constraints Oath::Constraints::SignedOut.new do
    root 'landings#show'
  end

  resources :entries

  #unauthenticated landing page
  resources :landings, only: :show

  #sessions
  resources :sessions, only: :create
  resource :sessions, only: :destroy, as: :session
  get 'sign_in', to: 'sessions#new', as: :new_session

  resources :users, only: [:new, :create]
end
