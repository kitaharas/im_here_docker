Rails.application.routes.draw do
  
  root 'home#index'
  get 'about', to: 'home#about'
  get 'feel', to: 'home#feel'
  get 'genre', to: 'home#genre'
  post 'user/create', to: 'users#create'
  post 'home/login' , to: 'home#login'
  post '/', to: 'home#index'
  get 'users/:id/edit', to: 'users#edit' 
  get 'users/:id', to: 'users#show', as: 'mypage'
  # get 'login',   to: 'sessions#new'
  post 'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
