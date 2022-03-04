Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[create index]
      end
     
    end
    
  end

  resources :users, only: [] do
    member do
      get 'api_token'
    end
  end


  resources :users, only: %i[index show] do
    resources :posts, only: %i[index create destroy new show] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end

  end
end
