module MainHelper

def disc(team, size = "small")

		image_path = size + "_logo_icons/"

		if true
			image_path += "color_disc_" 
		else
			image_path += "grey_disc_"
		end

		image_path += team.team_name.downcase
		style = "left: #{team.x_map_point}px; bottom: #{team.y_map_point}px"
		
		image_tag image_path + ".png", :class => "#{size}_disc", :style => style 

end


end
