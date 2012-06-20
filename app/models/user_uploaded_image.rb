class UserUploadedImage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :team
  has_attached_file :screenshot, 
  	:storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml", 
  	:path => "user_uploaded_images/:attachment/:style/:id.:extension",
  	:bucket => "pennant_images"


end
