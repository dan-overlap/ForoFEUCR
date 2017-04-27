Rails.application.routes.draw do
  
  
 
  resources :presentations
  resources :categories
  resources :news
  resources :blogs
  resources :comments
  resources :discussions
  resources :congresses 

  devise_for :users, :controllers => {:registrations => "users/registrations"} do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ForoFEUCR/', to: 'congresses#index'

  root 'congresses#index'


  #root 'users#index'

end
