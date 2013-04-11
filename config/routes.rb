Portal::Application.routes.draw do

  controller :sessions do
    get 'login'     => :new
    post 'login'    => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :organizations do
    resources :employments
  end
  
  match 'profile' => 'users#profile'

  root :to => 'dashboard#index'

end
