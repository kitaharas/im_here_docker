Rails.application.routes.draw do
  
  post 'create/:id', to: 'relationships#create', as: 'follow'
  post 'destroy/:id', to: 'relationships#destroy', as: 'unfollow'
  get 'relationships/followings'
  get 'relationships/followers'
  root 'home#index'
  get 'about', to: 'home#about'
  get 'feel', to: 'home#feel'
  get 'feel_page/:id', to: 'home#feel_page', as:'feel_page'
  get 'genre', to: 'home#genre'
  get 'genre_page/:id', to: 'home#genre_page', as:'genre_page'
  post 'users/create', to: 'users#create'
  post 'home/login' , to: 'home#login'
  post '/', to: 'home#index'
  get 'users/:id/edit', to: 'users#edit' , as: :edit_user
  patch 'users/:id/edit', to: 'users#update', as: :update_user
  get 'users/:id', to: 'users#show', as: 'mypage'
  get 'users/:id/our', to: 'users#show_our', as: 'show_our'
  get 'login',   to: 'sessions#new'
  post 'sessions/create',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  resources :users, params: :id


  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'folloeings', to: 'relationships#followings', as: 'followings'
    get 'followers', to: 'relationships#followers', as: 'followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end


end
