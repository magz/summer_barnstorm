class UserUploadedImage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :team
  has_attached_file :screenshot,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

end
