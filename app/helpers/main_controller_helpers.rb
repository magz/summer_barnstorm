module MainControllerHelpers
	

	def generate_team_hash(passed_team_name)
		team = parse_team_name passed_team_name
	end

	def parse_team_name
	end

	def get_overlay_images(team)
		team ||= "tigers"
		card_path = "iphone_overlay_cards/"
		overlay_images = []

		if team
			overlay_images << card_path + team + "_memories.jpg"
			overlay_images << card_path + team + "_futurecard.jpg"
			overlay_images << card_path + team + "_sharecard.jpg"
			overlay_images << card_path + team + "_titlecard.jpg"
		end

		overlay_images
	end










end