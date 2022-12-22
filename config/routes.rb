Rails.application.routes.draw do
  devise_for :users
 
  # get 'posts/index'
  # get 'users/sign_out', to: 'users#sign_out'

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end

  resources :posts
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
