module MainControllerHelpers
	

	def generate_team_hash(passed_team_name)
		team = parse_team_name passed_team_name
	end

	def parse_team_name
	end

	def get_overlay_images(team)
		team ||= Team.find_by_name "tigers"
		card_path = "iphone_overlay_cards/"
		overlay_images = []

		if team
			overlay_images << card_path + team.name + "_memories.jpg"
			overlay_images << card_path + team.name + "_futurecard.jpg"
			overlay_images << card_path + team.name + "_sharecard.jpg"
			overlay_images << card_path + team.name + "_titlecard.jpg"
		end

		overlay_images
	end










end