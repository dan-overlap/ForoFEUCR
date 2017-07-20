Rails.application.routes.draw do
  
  resources :banners
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :congresses do
    get '/admin/' , to: 'congresses#admin'
    post :adminToggle
    post :toggleDefault
    resources :categories do
      resources :presentations do
        resources :comments do
          member do
            get 'new_comment' => "comments#new_comment"
            put 'toggle_important' => "comments#toggle_important"
            put 'toggle_inappropriate' => "comments#toggle_inappropriate"
            put 'toggle_denounce' => "comments#toggle_denounce"
          end
        end
        member do
        get 'setParent' => "presentations#set_parent"
      end
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
