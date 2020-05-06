Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/posts/search', to: 'posts#search'
  resources :verbal_marks
  resources :comments
  resources :posts
  
  resources :users
  root 'home_page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
