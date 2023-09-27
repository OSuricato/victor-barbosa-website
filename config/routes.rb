Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

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
  resources :contacts, only: [:new, :create]
end
