Rails.application.routes.draw do

  devise_for :users

  resources :topics, except: [:edit,:update] do
    resources :bookmarks, except: [:index,:show]
  end

  resources :welcome, only: [:index]

  root 'welcome#index'

  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'
end
