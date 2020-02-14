Rails.application.routes.draw do
  
  resources :posts
  namespace :api do
    namespace :v1 do
      resources :users
      resources :comments
      resources :pics

    end
  end
end
