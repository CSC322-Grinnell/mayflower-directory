Rails.application.routes.draw do

  get 'profiles/new'
  get 'residents/new'
  
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'help', to: 'static_pages#help'
  get 'directory', to: 'static_pages#directory'
  get 'display', to: 'static_pages#display'
  get 'pictures', to: 'profiles#pictures'
  
  resources :profiles do
    collection { post :import }
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root 'static_pages#directory'

  devise_scope :user do
    post 'users/import', to: 'users/registrations#import_users'
  end
    
  resources :users do 
    root 'users#index'
    get 'edit_info' ,to: 'users#edit_info', on: :member
    get 'edit_password' ,to: 'users#edit_password', on: :member
  end

  devise_for :users, path: 'auth', 
    controllers: {registrations: "users/registrations"},
    # path_names: { sign_in: 'login', sign_out: 'logout', registrations: 'register'}
     path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
                  confirmation: 'verification', unlock: 'unblock', 
                  registration: 'register', sign_up: 'sign_up' }
    
               
end

