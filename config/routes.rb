TEDxYale::Application.routes.draw do

  resources :sponsors, :sponsorships, :users, :applications, :sessions, :subscriptions, 
            :application_cycles, :application_questions, :application_answers

  root :to => "events#root"

  get "/join", to: "applications#new"
  get "/app_email/:id", to: "applications#app_mailer"
  get "/signup", to: "users#signup"    
  get "/register", to: "users#new"
  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  get "/salons", to: "users#event_saman"
  get "/join", to: "users#join"
  get "/kevin_olusola_salon", to: "events#current_salon"
      
  #Admin Panel
  get "/admin", to: "admin#users"
  get "/admin/users", to: "admin#lists"
  get "/admin/users/all", to: "admin#users"
  get "/admin/lists/:id", to: "admin#show_list"
  get "/admin/events", to: "admin#events"
  get "/admin/finance", to: "admin#finance"
  get "/admin/speakers", to: "admin#speakers"
  get "/admin/speakers/:id", to: "admin#show_speaker"
  get "/admin/speakers/:id/edit", to: "admin#edit_speaker"
  get "/admin/tv", to: "admin#tv"
  get "/admin/applications", to: "admin#applications"
  get "/admin/sponsors", to: "admin#sponsors"
  get "/admin/competition", to: "applications#admin"
  get "/admin/student_speakers", to: "admin#student_speakers"
  get "/admin/votes", to: "admin#votes"
  
  # Application Cycles
  get "/application_cycles/:id/new_question", to: "application_cycles#new_question"
  get "/apply/:slug", to: "applications#new"
  
  get "promote", to: "users#promote", :as => "promote_users"
  
  #Wiki
  
  resources :posts
  
  get "/wiki", to: "posts#index"
  get "/wiki/new", to: "posts#new"
  
  #Events
  
  resources :events
  
  resources :attendees
  
  get "/events", to: "events#index"
  get "/check_in", to: "attendees#check_in", :as => "check_in_attendees"
  get "/check_out", to: "attendees#check_out", :as => "check_out_attendees"
  get "/attend", to: "attendees#register", :as => "signup_attendees"
  get "/unregister", to: "attendees#unregister", :as => "delete_attendees"
  get "/events/:id/registration", to: "events#registration"
  put "/publish", to: "events#publish", :as => "publish_events"
  put "/unpublish", to: "events#unpublish", :as => "unpublish_events"
  
  #About
  
  get "/about", to: "about#index"
  
  #TV 
  
  resources :videos
  
  get "/tv/new" => 'videos#new'  
  get "/tv", to: "videos#index"
  
  #Dashboard
  
  get "/dashboard/current_events", to: "users#current_events"
  get "/dashboard/attended_events", to: "users#attended_events"
  get "/dashboard/preferences", to: "users#edit"
  
  get "add_attended", to: "attendees#add_attended", :as => "add_attendees"
  
  #speakers
  resources :speakers
  get "/become_a_speaker", to: "speakers#new_student"
  get "/speaker_login", to: "sessions#speaker"
  get "/speaker", to: "speakers#admin"
  get "/sessions/student_create", to: "sessions#speaker_create"
  get "/speaker/personal", to: "speakers#personal"
  get "/speaker/questionnaire", to: "speakers#questionnaire"
  get "/speaker/talk", to: "speakers#talk_information"
  get "/speaker/account", to: "speakers#account"
  get "/speaker/release_form", to: "speakers#release_form"
  get "/speaker/announcement", to: "speakers#announcement"
  get "/speaker/:id/public", to: "speakers#public"
  get "/speaker/:id/unpublic", to: "speakers#unpublic"
  
  # Sponsors
  get "/sponsorships/new", to: "sponsors#new_sponsorship"
  
  # 2013
  resources :student_speakers
  get "/2013", to: "events#conference"
  get "/facebook", to: "student_speakers#facebook"
  post "/users/:id/vote/:video", to: "student_speakers#vote"
  get "/me", to: "users#me"
  get "/voting_data", to: "student_speakers#voting_data"
  get "/early_bird", to: "student_speakers#early_bird"
  get "/process_stripe", to: "student_speakers#process_stripe"
  get "/events/2013/speakers", to: "events#conference_speakers"
  
  # 2014
  get "/2014", to: "applications#student_speaker_competition"
  get "/student_speaker_competition", to: "applications#student_speaker_competition"
  post "/email_nomination/:id", to: "applications#email_nomination", as: "email_nomination"
  get "/student_speaker_leaders", to: "student_speakers#leaders"
  
  # Facebook
  get 'auth/:provider/callback', to: 'sessions#create_from_facebook'
  get 'auth/failure', to: redirect('/2014')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
end
