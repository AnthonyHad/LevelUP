Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create] do
    resources :reviews, only: [ :index, :new, :create ]
    resources :posts, only: [:new, :create] do
      collection do
        get :discussion
        get :devlogs
      end
    end
  end

  resources :posts, only: [:destroy] do
    resources :replies, only: [:create]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
