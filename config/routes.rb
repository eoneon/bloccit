Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
    resources :comments, module: :topics
    resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, module: :posts
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
