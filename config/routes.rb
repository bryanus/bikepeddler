Bikepeddler::Application.routes.draw do
  
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root :to => 'posts#index'

  resources :posts do
    resources :images, :except => [:update, :edit]
    member do 
      post 'sold'
    end
  end

  resources :comments
  resources :users
  resources :sessions
  resources :password_resets

end
