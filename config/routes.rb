Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  resources :post_categories
end
