SummerBarnstorm::Application.routes.draw do


  resources :emails
  resources :user_uploaded_images
  resources :teams





  match "how_to" => "main#how_to", :as => :how_to
  
  match "help" => redirect("http://toppspennant.zendesk.com"), :as => :help
  match "terms" => "main#terms", :as => :terms
  match "privacy" => "main#privacy", :as => :privacy
  #where is this supposed to go?
  match "giveaway_rules" => 'main#giveaway_rules', :as => :giveaway_rules
  match "redirector" => "main#team_page_redirector", :as => :redirector


  


  match "/send_link" => "main#send_link", :via => :post, :as => :send_link
  match "mail_list_signup" => "emails#create", via: :post, :as => :email_list_signup


  match "timecapsule/:team" => "main#timecapsule", :as => :timecapsule
  match "timecapsule" => "main#timecapsule"
  match "test" => "main#test"
  match "/:team" => "main#welcome"  

  root :to => 'main#welcome'
end
