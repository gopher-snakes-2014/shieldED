Rails.application.routes.draw do
  resources :users

  root 'users#index'

  post  '/users/login/admin'              => 'users#process_login_admin',     :as => 'process_login_admin'
  post  '/users/login/sp'                 => 'users#process_login_sp',        :as => 'process_login-sp'
  get   '/logout'                         => 'users#logout',                  :as => 'logout'

  get   '/parents/dashboard'              => 'users#parent_dashboard',        :as => 'parent_dashboard'
  get   '/students/dashboard'             => 'users#student_dashboard',       :as => 'student_dashboard'

  get   '/admins/dashboard'               => 'admins#admin_dashboard',        :as => 'admin_dashboard'
  get   '/admins/dashboard/search'        => 'admins#search',                 :as => 'search'

  get '/admins/dashboard/charts'          => 'admins#charts'

  get   '/events/:id/show'                => 'events#show',                   :as => "show_event"
  get   '/events/new'                     => 'events#new',                    :as => "new_event"
  post  '/events/new'                     => 'events#create'

  get   '/tags/show'                      => 'tags#show',                    :as => "show_tags"

  post  '/events/:id/event_tags/create'   => 'event_tags#create',             :as => "event_tags_create"


end
