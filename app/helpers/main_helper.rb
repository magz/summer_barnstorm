module MainHelper

MAP_RATIO = 840.0 / 1491.0

	def blank_disc(team, color=true)

			# This represents the ratio between the original map image size (1491) and the current setting (840)
			# It is currently == 0.563380282

			image_path = "blank_discs/"

			if color
				image_path += team.team_name + "_blank_color_disc"
			else
				image_path += "grey_blank_disc"
			end

			image_path += ".png"

			style = team_center_css(team, side)
			image_tag image_path, :class => "team_disc", :data => {team: team.team_name.downcase}, :style => style, :size => side.to_s + "x" + side.to_s

	end

	def team_logo(team)
		image_path = "team_logos/" + team.team_name + "_logo.png"

		side = 22
		style = team_center_css(team, 44)


		image_tag image_path, :class => "team_logo", :data => {team: team.team_name.downcase}, :style => style, :size => side.to_s + "x" + side.to_s




	end

	# def team_center_css(team, side_size)
	# 	"left: #{team.x_map_point.to_f * MAP_RATIO - side_size.to_f/2}px ; top: #{team.y_map_point.to_f * MAP_RATIO - side_size.to_f/2}px"
	# end

	def get_center_css(team, side_size)
		"left: #{team.x_map_point.to_f * MAP_RATIO - side_size.to_f/2}px ; top: #{team.y_map_point.to_f * MAP_RATIO - side_size.to_f/2}px"
	end

	def small_team_disc_generator(team, color = true)
		center_css = get_center_css(team, 45)
		("<div class=small_team_disc style='" + center_css + "'>" + new_blank_disc(team, color) + new_team_logo(team) + "</div>").html_safe 

	end

	def new_blank_disc(team, color=true)
		image_path = "blank_discs/"

		if color
			image_path += team.team_name + "_blank_color_disc"
		else
			image_path += "grey_blank_disc"
		end

		image_path += ".png"

		image_tag image_path, :class => "blank_disc"


	end

	def new_team_logo(team)
		image_path = "team_logos/" + team.team_name + "_logo.png"
		image_tag image_path, :class => "team_logo"

	end

end
