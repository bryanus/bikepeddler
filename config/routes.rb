Bikepeddler::Application.routes.draw do

  root :to => 'posts#index'

  resources :posts do
    resources :images, :except => [:update, :edit]
  end

end
