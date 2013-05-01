Portal::Application.routes.draw do

  controller :sessions do
    get 'login'     => :new
    post 'login'    => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :organizations do
    resources :employments do
      member do
        put 'add_head_contact'
        put 'remove_head_contact'
      end
    end
  end
  
  match 'profile' => 'users#profile'

  root :to => 'dashboard#index'
  
  namespace :api do
    controller :login do
      get 'login' => :new
      post 'login' => :new
    end
    
    controller :organizations do
      get 'organizations' => :index
    end
  end

end
