class Team < ActiveRecord::Base
	has_many :user_uploaded_images

	attr_accessible :city, :color, :team_name, :x_map_point, :y_map_point, :twitter_tags
	serialize :twitter_tags, Array
end
