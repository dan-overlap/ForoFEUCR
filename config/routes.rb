Rails.application.routes.draw do
  
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :congresses do
    resources :categories do
      resources :presentations do
        resources :comments
      end
    end
     resources :news
  end    


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ForoFEUCR/', to: 'congresses#index'

  root 'congresses#index'


  #root 'users#index'

end
