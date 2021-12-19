Rails.application.routes.draw do
  
  root 'home#index'
  get 'about', to: 'home#about'
  get 'feel', to: 'home#feel'
  get 'genre', to: 'home#genre'
  get 'users/:id', to: 'users#show', as: 'mypage'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
