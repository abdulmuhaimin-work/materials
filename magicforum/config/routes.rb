Rails.application.routes.draw do
  root to: 'landing#landing'
  get :about, to: 'static_pages#about'
  resources :topics do
    resources :posts do
      resources :comments
    end
  end
  resources :users, only: [:new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  mount ActionCable.server => '/cable'
  post :upvote, to: 'votes#upvote'
  post :downvote, to: 'votes#downvote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
