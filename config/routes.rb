Rails.application.routes.draw do
  
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :presentations
  resources :categories
  resources :news
  resources :blogs
  resources :comments
  resources :discussions
  resources :congresses  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ForoFEUCR/', to: 'congresses#index'

  root 'congresses#index'


  #root 'users#index'

end
