Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # get '/posts/search', to: 'posts#search', as: 'search'
  resources :verbal_marks
  resources :comments
  resources :posts
  
  resources :users, path: 'codrs', as: 'users'
  # get '/codrs', to: 'users#index', as 'codrs'
  root 'posts#index'
  get '/profile', to: 'home_page#profile', as: 'profile' 
  get '/community', to: 'users#index', as: 'community'
  get '/chatroom', to: 'home_page#chatroom', as: 'chatroom' 
  get '/guidelines', to: 'home_page#guidelines', as: 'guidelines' 

  get '/filters', to: 'filters#index'
  post '/filters', to: 'filters#index'
  get '/filters/search', to: 'filters#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
