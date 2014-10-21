Rails.application.routes.draw do
  # resources :users

  root 'users#index'

  # post  '/sessions/login/admin'           => 'sessions#process_login_admin',     :as => 'process_login_admin'
  # post  '/sessions/login/sp'              => 'sessions#process_login',           :as => 'process_login'
  post '/sessions/login'                 => 'sessions#create',                  :as => 'login'
  # post '/sessions/login/sp'               => 'sessions#create'                   :as => 'create_sp_session'
  get  '/sessions/logout'                => 'sessions#logout',                  :as => 'logout'

  get   '/users/parents/dashboard'        => 'users#parent_dashboard',        :as => 'parent_dashboard'
  get   '/users/students/dashboard'       => 'users#student_dashboard',       :as => 'student_dashboard'

  get   '/admins/dashboard'               => 'admins#admin_dashboard',        :as => 'admin_dashboard'
  get   '/admins/dashboard/search'        => 'admins#search',                 :as => 'search'

  get   '/events/new'                     => 'events#new',                    :as => "new_event"
  post  '/events/new'                     => 'events#create'
  get   '/events/:id'                     => 'events#show',                   :as => "show_event"
  post  '/events/:id/event_tags/create'   => 'event_tags#create',             :as => "event_tags_create"

  get   '/tags/show'                      => 'tags#show',                    :as => "show_tags"

end
