Rails.application.routes.draw do
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index create new show] do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create]
    end

  end
end
