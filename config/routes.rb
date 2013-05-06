Portal::Application.routes.draw do

  # Non-resource controllers
  controller :sessions do
    get 'login'     => :new
    post 'login'    => :create
    delete 'logout' => :destroy
  end

  # Resources
  resources :users
  resources :organizations do
    resources :employments do
      member do
        put 'add_head_contact'
        put 'remove_head_contact'
      end
    end
    
    resources :opening_hours, :only => :create
  end

  resources :opening_hours
  resources :campaigns

  # Slugs
  match 'profile' => 'users#profile'
  # Root
  root :to => 'dashboard#index'
  
  # API routes
  namespace :api do
    controller :login do
      get 'login' => :new
      post 'login' => :new
    end
    
    controller :organizations do
      get 'organizations' => :index
      get 'organizations/:id/campaigns' => :campaigns
      get 'organizations/:id/opening_hours' => :opening_hours
    end
  end

end
