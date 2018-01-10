Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :subreddits, except: [:destroy] do
    resources :moderators, only: [:new, :create]
  end
  resources :moderators, only: [:destroy]
  resources :comments, only: [:show]
end
