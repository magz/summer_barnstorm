module MainControllerHelpers
	

	def generate_team_hash(passed_team_name)
		team = parse_team_name passed_team_name
	end

	def parse_team_name
	end

	def get_overlay_images(team)
		team = Team.find_by_name team
		team ||= "default"
		
		card_path = "iphone_overlay_cards/"
		overlay_images = []

		if team == "default"
			overlay_images = ["default_memories.jpg", "default_futurecard.jpg", 
				"default_sharecard", "tigers_3.jpg", "braves_1.jpg"]
		else
			overlay_images << card_path + team.name + "_memories.jpg"
			overlay_images << card_path + team.name + "_futurecard.jpg"
			overlay_images << card_path + team.name + "_sharecard.jpg"
			
			(1..3).each do |x|
				f = "app/assets/images/" + card_path + team.name + "_" + x.to_s + ".jpg"
				logger.info "does file exist?"
				logger.info File.exists? f
				if File.exists? f
					overlay_images << f
				end
			end
			
			overlay_images << card_path + team.name + "_titlecard.jpg"
		end
		overlay_images.each {|o| logger.info o}
		overlay_images
	end










end