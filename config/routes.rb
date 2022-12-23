Rails.application.routes.draw do
  devise_for :users
 
  # get 'posts/index'
  # get 'users/sign_out', to: 'users#sign_out'

  root 'users#index'
  get 'token/api', to: 'users#token'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end

  # resources :posts
  # namespace :api, :defaults => {:format => :json} do
  namespace :api do
   namespace :v1 do
     resources :users, only: %i[index show] do
       resources :posts, only: %i[index show new create destroy] do
         resources :comments, only: %i[index show new create destroy]
         resources :likes, only: %i[create]
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
