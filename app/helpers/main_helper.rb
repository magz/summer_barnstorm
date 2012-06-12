module MainHelper

MAP_RATIO = 840.0 / 1491.0

def disc(team, size = "large", color=true)

		# This represents the ratio between the original map image size (1491) and the current setting (840)
		# It is currently == 0.563380282

		image_path = "large_logo_icons/"

		if color
			image_path += "color_disc_" 
		else
			image_path += "grey_disc_"
		end

		image_path += team.team_name.downcase
		if size == "small"
			side = "50"
		else
			side = "150"
		end
		style = "left: #{team.x_map_point.to_f * MAP_RATIO - side.to_f/2}px ; top: #{team.y_map_point.to_f * MAP_RATIO - side.to_f/2}px"
		
		image_tag image_path + ".png", :class => "#{size}_disc", :style => style, :size => side + "x" + side

end


end
