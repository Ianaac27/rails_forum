Rails.application.routes.draw do
  resources :posts
  # resources :posts
  root "post#index"
end
