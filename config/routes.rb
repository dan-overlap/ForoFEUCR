Rails.application.routes.draw do
  
  resources :banners
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :congresses do
    get '/admin/' , to: 'congresses#admin'
    post :adminToggle
    post :toggleDefault
    resources :categories do
      resources :presentations do
        resources :comments
      end
    end
    resources :events
    resources :downloads
    resources :banners
    resources :news do
      member do
        put 'like' => "news#vote"
      end
    end
  end    


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ForoFEUCR/', to: 'congresses#index'

   root :to => 'congresses#default'


  #root 'users#index'

end
