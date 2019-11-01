Rails.application.routes.draw do
  get 'session/new'
  get 'like/create'
  get 'comment/edit'
  resources :gossip, except: [:destroy] 
  resources :author
  resources :welcome, only: [:index, :show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :city 
  resources :sessions, only: [:new, :create, :destroy]
  resources :comment
  resources :like
  

end
