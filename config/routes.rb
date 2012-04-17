TEDxYale::Application.routes.draw do

  resources :users

  root :to => "users#subscribe"
  
  match "/subscribe" => "users#subscribe"
  
  match "/join/community_pr" => "users#community_pr"
  
  match "/join/design" => "users#design"
  
  match "/join/events" => "users#events"
  
  match "/join/finance" => "users#finance"
  
  match "/join/production" => "users#production"
  
  match "/join" => "users#join"
  
  resources :sessions
      
  resources :admins
  
  #match "/sessions" => "sessions#new.html.erb"
  
  match "/register" => "admins#new"
  
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout" 
  
  match "/salons" => "users#event_saman"
  
  match "/join" => "users#join"
  
  match "/registration" => "users#registration"
  
  match "check_in" => "users#check_in", :as => "check_in_user"
end
