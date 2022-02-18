Rails.application.routes.draw do
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
