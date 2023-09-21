Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'blog', to: 'posts#blog', as: 'blog'
  get 'portfolio', to: 'posts#portfolio', as: 'portfolio'


  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  resources :post_categories
end
