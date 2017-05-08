Rails.application.routes.draw do
  
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :congresses do
    resources :categories do
      resources :presentations
    end
     resources :news
  end    
  
 
  resources :comments
  resources :discussions
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ForoFEUCR/', to: 'congresses#index'

  root 'congresses#index'


  #root 'users#index'

end
