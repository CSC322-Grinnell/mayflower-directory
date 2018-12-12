Rails.application.routes.draw do
  
  get 'password_resets/new'
  get 'password_resets/edit'

  get 'profiles/new'
  get 'residents/new'
  
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'help', to: 'static_pages#help'
  get 'search', to: 'static_pages#search'
  get 'display', to: 'static_pages#display'
  get 'directory', to: 'profiles#directory'
  
  resources :profiles do
    collection { post :import }
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root 'static_pages#search'

  devise_scope :user do
    post 'users/import', to: 'users/registrations#import_users'
  end
  
  resources :users
  root 'users#index'


  devise_for :users, path: 'auth', 
    controllers: {registrations: "users/registrations"},
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
                  confirmation: 'verification', unlock: 'unblock', 
                  registration: 'register', sign_up: 'sign_up' }
    
               
end

