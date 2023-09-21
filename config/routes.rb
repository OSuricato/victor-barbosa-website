Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  resources :post_categories
end
