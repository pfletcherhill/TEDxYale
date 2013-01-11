TEDxYale::Application.routes.draw do

  resources :sponsors, :sponsorships

  resources :users

  root :to => "users#new"

  match "/join" => "applications#new"
  match "/app_email/:id" => "applications#app_mailer"
  match "/signup" => "users#signup"
  
  resources :applications
  
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
  match "/admin/speakers" => "admin#speakers"
  match "/admin/speakers/:id" => "admin#show_speaker"
  match "/admin/tv" => "admin#tv"
  match "/admin/applications" => "admin#applications"
  match "/admin/sponsors" => "admin#sponsors"
  
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
  
  resources :videos
  
  match "/tv/new" => 'videos#new'  
  match "/tv" => "videos#index"
  
  #Dashboard
  
  match "/dashboard/current_events" => "users#current_events"
  match "/dashboard/attended_events" => "users#attended_events"
  match "/dashboard/preferences" => "users#edit"
  
  match "add_attended" => "attendees#add_attended", :as => "add_attendees"
  
  #speakers
  resources :speakers
  match "/become_a_speaker" => "speakers#new_student"
  match "/speaker_login" => "sessions#speaker"
  match "/speaker" => "speakers#admin"
  match "/sessions/student_create" => "sessions#speaker_create"
  match "/speaker/personal" => "speakers#personal"
  match "/speaker/questionnaire" => "speakers#questionnaire"
  match "/speaker/talk" => "speakers#talk_information"
  match "/speaker/account" => "speakers#account"
  match "/speaker/release_form" => "speakers#release_form"
  match "/speaker/announcement" => "speakers#announcement"
  
  # Sponsors
  match "/sponsorships/new" => "sponsors#new_sponsorship"
  
  # 2013
  resources :student_speakers
  match "/2013" => "events#conference"
  match "/facebook" => "student_speakers#facebook"
  match "/users/:id/vote/:video" => "student_speakers#vote"
  match "/me/votes_count" => "users#votes_count"
  match "/voting_data" => "student_speakers#voting_data"
  match "/early_bird" => "student_speakers#early_bird"
  match "/process_stripe" => "student_speakers#process_stripe"
  match "/events/2013/speakers" => "events#conference_speakers"
  
end
