class UserUploadedImage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :team
  has_attached_file :screenshot

end
