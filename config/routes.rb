# frozen_string_literal: true

Rails.application.routes.draw do
  resources :masterkeys
  resources :message_histories
  resources :messages
  # resources :students

  resources :students do
    collection do
      get 'deleteAll'
    end
  end

  resources :students_imports, only: %i[new create]

  get 'students_imports/new'
  get 'students_imports/create'

  # devise_for :users
  devise_for :users, controllers: { registrations: 'user' }

  resources :message_histories
  resources :carriers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posttext', to: 'posttext#posttext'
  get 'home/dashboard'
  get 'home/homepage'
  root 'posttext#posttext'

  get  'help', to: 'help#index'
end
