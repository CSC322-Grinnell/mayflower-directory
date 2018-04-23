Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'profiles/new'
  get 'residents/new'
  get '/about'
  get '/home'
  get '/help'
  get '/search'
  get '/display'
  get 'home', to: '#home'
  get 'about', to: '#about'
  get 'help', to: '#help'
  get 'search', to: '#search'
  get 'display', to: '#display'
  resources :profiles do
    collection { post :import }
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  
  root '#search'
  
  #devise_for :users, path: 'users'
  #path_names :{ sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_for :users, path: 'auth', 
    controllers: {registrations: "users/registrations"},
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up'  }
  #devise_for :users, path_names: {sign_up: 'sign_up'}
  #after_sign_in_path_for '/home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
  # Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'
  
  

  #get '/about'

   ##    sessions: 'users/sessions'
     # }
    #end
    
end

