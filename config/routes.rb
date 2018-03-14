Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  resources :topics, except: [:edit,:update] do
    resources :bookmarks, except: [:index,:show] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  resources :welcome, only: [:index]

  root 'welcome#index'

  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'
end
