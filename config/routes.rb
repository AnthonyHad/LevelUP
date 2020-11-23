Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create] do
    resources :posts, only: [:new, :create] do
      collection do
        get :discussion
        get :devlogs
      end
    end
  end

  resources :posts, only: [] do
    resources :replies, only: [:create]
  end
end
