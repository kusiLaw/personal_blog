Rails.application.routes.draw do
  get 'posts/index'
  # get 'users/index'
  root 'users#index'
  
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
