Flitter::Application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }
#  resources :users, :only [:index, :show]
  
#  get "sessions/new"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "welcome#index"

#  resources :account_activations, only: [:edit]
#  resources :password_resets,     only: [:new, :create, :edit, :update]
#  resources :relationships,       only: [:create, :destroy]
#  resources :notifications,       only: [:update]
    
  resources :microposts,  only: [:create, :destroy] do
    resources :comments,  only: [:new, :create, :destroy]
  end
    
  resources :users, only: [:index, :show, :destroy] do
    member do
      get     :following, :followers
      post    :follow
      delete  :unfollow
    end
  end
    
  get     '/home'                   => 'home#index', as: :user_root
  patch   'notifications/read_all'  => 'notifications#read_all'
#  get     'login'   =>  'sessions#new'
#  post    'login'   =>  'sessions#create'
#  delete  'logout'  =>  'sessions#destroy'
  
#  get     "signup"  =>  "users#new"
##  
#  get     "help"    =>  "welcome#help"
#  get     "about"   =>  "welcome#about"
#  get     "contact" =>  "welcome#contact"
    
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
end
