Rails.application.routes.draw do

  devise_for :users

  resources :topics

  resources :welcome, only: [:index, :about]

  root 'welcome#index'

  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'
end
