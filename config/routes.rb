Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create] do
    resources :followings, only: [ :create ]
    resources :reviews, only: [ :index, :new, :create ]
    resources :posts, only: [:new, :create] do
      collection do
        get :discussion
        get :devlogs
      end
    end
  end

  resources :followings, only: [ :index, :destroy ]

  resources :posts, only: [:destroy] do
    resources :replies, only: [:create]
  end

  resources :posts, only: [] do
    member do
      put "like" => "posts#like"
      get "update_counter" => "posts#update_counter"
    end
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :users

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
