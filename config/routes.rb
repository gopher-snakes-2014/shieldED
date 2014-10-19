Rails.application.routes.draw do
  resources :users

  root 'users#index'

  post '/users/login'                   => 'users#process_login',      :as => 'process_login'
  get  '/logout'                        => 'users#logout',             :as => 'logout'

  get '/parents/dashboard'              => 'users#parent_dashboard',   :as => 'parent_dashboard'
  get '/students/dashboard'             => 'users#student_dashboard',  :as => 'student_dashboard'

  get '/users/admins/dashboard'         => 'admins#admin_dashboard',   :as => 'admin_dashboard'
  get '/users/admins/dashboard/search'  => 'admins#search',            :as => 'search'

  get '/events/:id/show'                => 'events#show',              :as => "show_event"
  get '/events/new'                     => 'events#new',               :as => "new_event"
  post '/events/new'                    => 'events#create'

  get '/tags/show'                      => 'tags#_show',               :as => "show_tags"

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
