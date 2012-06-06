module MainHelper

def disc(team, size = "large", color=true)

		image_path = "large_logo_icons/"

		if color
			image_path += "color_disc_" 
		else
			image_path += "grey_disc_"
		end

		image_path += team.team_name.downcase
		if size == "small"
			image_size = "75x75"
		else
			image_size = "150x150"
		end
		style = "left: #{team.x_map_point}px; bottom: #{team.y_map_point}px"
		
		#image_tag image_path + ".png", :class => "#{size}_disc", :style => style, :size => image_size
		image_path
end


end
