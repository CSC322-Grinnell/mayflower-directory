Rails.application.routes.draw do
  
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'profiles/new'
  get 'residents/new'
  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/search'
  get 'static_pages/display'
  
  post 'users/import', to: 'profiles#import_users'
  
  resources :profiles
  
  root 'static_pages#search'

  devise_for :users, path: 'auth', 
    controllers: {registrations: "users/registrations"},
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
                  confirmation: 'verification', unlock: 'unblock', 
                  registration: 'register', sign_up: 'sign_up' }
  
  get 'password_resets/new'

  get 'password_resets/edit'
  
  
end
