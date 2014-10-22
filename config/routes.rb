Rails.application.routes.draw do
  # resources :users

  root 'users#index'
  post '/sessions/login'                 => 'sessions#create',                  :as => 'login'
  get  '/sessions/logout'                => 'sessions#logout',                  :as => 'logout'

  get   '/users/parents/dashboard'        => 'users#parent_dashboard',        :as => 'parent_dashboard'
  get   '/users/students/dashboard'       => 'users#student_dashboard',       :as => 'student_dashboard'

  get   '/admins/dashboard'               => 'admins#admin_dashboard',        :as => 'admin_dashboard'
  get   '/admins/dashboard/search'        => 'admins#search',                 :as => 'search'

  get '/admins/dashboard/pie'          => 'admins#pie'
  get '/admins/dashboard/bubbles'          => 'admins#bubbles'

  get   '/events/:id/show_partial'        => 'events#show_partial',           :as => "show_event_partial"
  get   '/events/new'                     => 'events#new',                    :as => "new_event"
  post  '/events/new'                     => 'events#create'
  get   '/events/:id'                     => 'events#show',                   :as => "show_event"
  post  '/events/:id/event_tags/create'   => 'event_tags#create',             :as => "event_tags_create"

  get   '/tags/show'                      => 'tags#show',                    :as => "show_tags"


end
