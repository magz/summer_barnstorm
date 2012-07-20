SummerBarnstorm::Application.routes.draw do



  resources :emails
  resources :user_uploaded_images
  resources :teams





  match "how_to" => "main#how_to", :as => :how_to


  #where is this supposed to go?
  match "redirector" => "main#team_page_redirector", :as => :redirector


  


  match "/send_link" => "main#send_link", :via => :post, :as => :send_link
  match "mail_list_signup" => "emails#create", via: :post, as: :email_list_signup



  
  match "timecapsule" => "main#timecapsule", :as => :timecapsule
  root :to => 'main#welcome'

end
