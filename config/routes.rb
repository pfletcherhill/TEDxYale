TEDxYale::Application.routes.draw do

  resources :users

  root :to => "users#new"
  
  match "/subscribe" => "subscriptions#new"
  
  match "/join/community_pr" => "users#community_pr"
  
  match "/join/design" => "users#design"
  
  match "/join/events" => "users#events"
  
  match "/join/finance" => "users#finance"
  
  match "/join/production" => "users#production"
  
  match "/join" => "users#join"
  
  resources :sessions
      
  resources :subscriptions
    
  match "/register" => "users#new"
  
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout" 
  
  match "/salons" => "users#event_saman"
  
  match "/join" => "users#join"
    
  #Admin Panel
  
  match "/admin" => "admin#users"
  
  match "/admin/users" => "admin#users"
  
  match "/admin/events" => "admin#events"
  
  match "/admin/finance" => "admin#finance"
  
  match "/admin/tv" => "admin#tv"
  
  match "promote" => "users#promote", :as => "promote_users"
  
  #Wiki
  
  resources :posts
  
  match "/wiki" => "posts#index"
  match "/wiki/new" => "posts#new"
  
  #Events
  
  resources :events
  
  resources :attendees
  
  match "/events" => "events#index"
  
  match "check_in" => "attendees#check_in", :as => "check_in_attendees"
  
  match "check_out" => "attendees#check_out", :as => "check_out_attendees"
  
  match "attend" => "attendees#register", :as => "signup_attendees"
  
  match "unregister" => "attendees#unregister", :as => "delete_attendees"
  
  match "events/:id/registration" => "events#registration"
  
  match "publish" => "events#publish", :as => "publish_events"
  
  match "unpublish" => "events#unpublish", :as => "unpublish_events"
  
  #About
  
  match "/about" => "about#index"
  
  #TV 
  
  match "/tv" => "tv#index"
  
  #Dashboard
  
  match "/dashboard/current_events" => "users#current_events"
  match "/dashboard/attended_events" => "users#attended_events"
  match "/dashboard/preferences" => "users#edit"
  
  match "add_attended" => "attendees#add_attended", :as => "add_attendees"
  
  #speakers
  resources :speakers
  
end
