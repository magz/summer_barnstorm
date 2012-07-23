SummerBarnstorm::Application.routes.draw do


  resources :emails
  resources :user_uploaded_images
  #resources :teams





  match "how_to" => "main#how_to", :as => :how_to
  
  match "help" => redirect("http://toppspennant.zendesk.com"), :as => :help
  #match "terms" => redirect("http://bunt.topps.com/terms"), :as => :terms
  match "terms" => "main#terms"
  #match "privacy" => redirect("http://bunt.topps.com/privacy"), :as => :privacy
  match "privacy" => "main#privacy"
  #where is this supposed to go?

  match "redirector" => "main#team_page_redirector", :as => :redirector


  


  match "/send_link" => "main#send_link", :via => :post, :as => :send_link
  match "mail_list_signup" => "emails#create", via: :post, :as => :email_list_signup


  
  match "timecapsule" => "main#timecapsule", :as => :timecapsule

  match "/:team" => "main#welcome"

  root :to => 'main#welcome'
end
